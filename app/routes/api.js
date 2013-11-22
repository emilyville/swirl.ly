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
    return Q.reject(new Error("Invalid request parameters"));
  }
  return Q.resolve({latitude: latitude, longitude: longitude});
}

function deferredConnect() {
  var deferred = Q.defer();
  pg.connect(connString, function(err, client, done) {
    if (err) {
      deferred.reject(new Error("A connection error has occurred."));
    }
    deferred.resolve([client, done]);
  });
  return deferred.promise;
}

function deferredQuery(client, queryString) {
  var deferred = Q.defer();
  client.query(queryString, function(err, result) {
    if (err) {
      deferred.reject(new Error("A query error has occurred."));
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
  http.get(options, function(res){
    var data = "";

    function onData(chunk){
      data += chunk;
    }
    res.on("data", onData);
    res.on("error", function(error) {
      deferred.reject(new Error(error));
    });

    function onEnd(chunk){
      console.log("onend");
      try {
        var el_response = JSON.parse(data);
        deferred.resolve(el_response.results[0]);
      } catch (exception) {
        console.log("caught exception");
        deferred.reject(new Error("Bad json response"));
        console.log("rejected promise");
      }
    }
    res.on("end", onEnd);
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
            return getElevation(latitude, longitude).then(function(elevation_resp) {
              data.elevation = elevation_resp.elevation;
              return Q.resolve(data);
            }, function(error) {
              return Q.resolve(data);
            });
          } else {
            return Q.reject(new Error("No results for location."));
          }
        }).then(function(response) {
          res.send(response);
        });
    });
  }).fail(function(error) {
    res.send({error: error.message});
  });
};
