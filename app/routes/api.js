/*
 * Serve JSON to our AngularJS client
 */

var pg = require('pg');
var Q = require('q');

var connString = "postgres://swirly:swirly@localhost/watersheds";

function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function validateRequest(req) {
  var latitude = req.query.latitude;
  var longitude = req.query.longitude;

  if (!isNumber(latitude) || !isNumber(longitude)) {
    throw new Error("Invalid request parameters");
  }
  return {latitude: latitude, longitude: longitude};
}

function deferredConnect() {
  var deferred = Q.defer();
  pg.connect(connString, function(err, client, done) {
    if (err) {
      deferred.reject(new Error("An error has occurred."));
    }
    deferred.resolve([client, done]);
  });
  return deferred.promise;
}

function deferredQuery(client, queryString) {
  var deferred = Q.defer();
  client.query(queryString, function(err, result) {
    if (err) {
      deferred.reject(new Error("An error has occurred."));
    }
    deferred.resolve(result);
  });
  return deferred.promise;
}

var http = require('http');

function getElevation(lat, lng){
  var deferred = Q.defer();
  //Google Maps Options
  var options = {
    host: "maps.googleapis.com",
    port: 80,
    path: "/maps/api/elevation/json?locations=" + lat + "," + lng + "&sensor=true"
  };
  //GET request that handles the parsing of data too
  http.get( options, function( res ){
    var data = "";

    function onData( chunk ){
      data += chunk;  
    }
    res.on( "data", onData );

    function onEnd( chunk ){
      var el_response = JSON.parse( data );
      deferred.resolve(el_response.results[0]);
    }
    res.on( "end", onEnd );
  });
  return deferred.promise;
}

/*
 * GET watershed by location.
 */

exports.watershed = function(req, res){
  var latitude = req.query.latitude;
  var longitude = req.query.longitude;
  Q.when(validateRequest(req), function(resp) {
    return deferredConnect().spread(function(client, done) {
      return deferredQuery(client, [
          "select ",
          "sfp_watershed.name1, sfp_watershed.facility, ",
          "ST_X(ST_TRANSFORM(ST_CENTROID(sf_wastewater_plant.geom), 4269)), ",
          "ST_Y(ST_TRANSFORM(ST_CENTROID(sf_wastewater_plant.geom), 4269)), ",
          "ST_DISTANCE(ST_CENTROID(sf_wastewater_plant.geom), ST_TRANSFORM(ST_PointFromText('POINT(" + longitude + " " + latitude + ")', 4269), 2227)) ",
          "from sfp_watershed left join sf_wastewater_plant ",
          "on sfp_watershed.facility = sf_wastewater_plant.name1 ",
          "where ST_Contains(sfp_watershed.geom, ST_TRANSFORM(ST_PointFromText('POINT(" + longitude + " " + latitude + ")', 4269), 2227))"
        ].join("")).then(function(result) {
          done();
          if (result.rows.length > 0) {
            data = {};
            data.watershed = result.rows[0].name1;
            data.facility = {
                longitude: result.rows[0].st_x,
                latitude: result.rows[0].st_y,
                name: result.rows[0].facility,
                distance: result.rows[0].st_distance/5280.0};
            return Q.resolve(data);
          } else {
            throw new Error("No results for location.");
          }
        }).then(function(response) {
          res.send(response);
        });
    });
  }, function(error) {
    res.send({error: error.message});
  });
};
