/*
 * Serve JSON to our AngularJS client
 */

exports.name = function (req, res) {
  res.json({
  	name: 'Bob'
  });
};

var pg = require('pg');

function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

/*
 * GET watershed by location.
 */

var connString = "postgres://swirly:swirly@localhost/watersheds";

exports.watershed = function(req, res){
  var latitude = req.query.latitude;
  var longitude = req.query.longitude;
  var data = {error: "", watershed: ""};
  if (!isNumber(latitude) || !isNumber(longitude)) {
    data["error"] = "Invalid request parameters";
    res.send(data);
    return;
  }  
  console.log("got watershed request");

  pg.connect(connString, function(err, client, done) {
    if (err) {
      done();
      data["error"] = err;
    } else {
      console.log(longitude + " " + latitude);
      client.query([
"select ",
"sfp_watershed.name1, sfp_watershed.facility, ",
"ST_X(ST_TRANSFORM(ST_CENTROID(sf_wastewater_plant.geom), 4269)), ",
"ST_Y(ST_TRANSFORM(ST_CENTROID(sf_wastewater_plant.geom), 4269)), ",
"ST_DISTANCE(ST_CENTROID(sf_wastewater_plant.geom), ST_TRANSFORM(ST_PointFromText('POINT(" + longitude + " " + latitude + ")', 4269), 2227)) ",
"from sfp_watershed left join sf_wastewater_plant ",
"on sfp_watershed.facility = sf_wastewater_plant.name1 ",
"where ST_Contains(sfp_watershed.geom, ST_TRANSFORM(ST_PointFromText('POINT(" + longitude + " " + latitude + ")', 4269), 2227))"
].join(""),
                 function(err, result) {
      if (err) {
        data["error"] = err;
      } else {
        if (result.rows.length > 0) {
	  console.log(result.rows[0]);
          data["watershed"] = result.rows[0].name1; 
          data["facility"] = {longitude: result.rows[0].st_x,
                              latitude: result.rows[0].st_y,
                              name: result.rows[0].facility,
                              distance: result.rows[0].st_distance/5280.0};
        } else {
          data["error"] = "No results";
        }
      }
      done();
      res.send(data);
    });
   }
  });
};
