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
      try {
        var el_response = JSON.parse(data);
        deferred.resolve(el_response.results[0]);
      } catch (exception) {
        deferred.reject(new Error("Bad json response"));
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
          "watershed.name1, watershed.facility, wastewater_plants.map_key, wastewater_plants.map_zoom, ",
          "ST_X(wastewater_plants.point_4269), ",
          "ST_Y(wastewater_plants.point_4269), ",
          "ST_DISTANCE_SPHERE(wastewater_plants.point_4269, ST_PointFromText('POINT(" + longitude + " " + latitude + ")', 4269)) ",
          "from watershed left join wastewater_plants ",
          "on watershed.facility = wastewater_plants.name1 ",
          "where ST_Contains(watershed.geom_4269, ST_PointFromText('POINT(" + longitude + " " + latitude + ")', 4269))"
        ].join("")).then(function(result) {
          done();
          if (result.rows.length > 0) {
            data = {};
            data.watershed = result.rows[0].name1;
            data.map_key = result.rows[0].map_key;
            data.map_zoom = result.rows[0].map_zoom;
            data.facility = {
                longitude: result.rows[0].st_x,
                latitude: result.rows[0].st_y,
                name: result.rows[0].facility,
                distance: result.rows[0].st_distance_sphere/1609.344};
            return getElevation(latitude, longitude).then(function(elevation_resp) {
              data.elevation = elevation_resp.elevation/0.3048;
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
