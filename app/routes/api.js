/*
 * Serve JSON to our AngularJS client
 */

exports.name = function (req, res) {
  res.json({
  	name: 'Bob'
  });
};

var pg = require('pg');

/*
 * GET watershed by location.
 */

var connString = "postgres://swirly:swirly@localhost/watersheds";

exports.watershed = function(req, res){
  var latitude = req.query.latitude;
  var longitude = req.query.longitude;
  var data = {error: "", watershed: ""};

  pg.connect(connString, function(err, client, done) {
    if (err) {
      done();
      data["error"] = err;
    } else {
      client.query("select name1 from sfp_watershed where ST_Contains(geom_4269, ST_PointFromText('POINT("+ longitude + " " + latitude + ")', 4269))",
                 function(err, result) {
      if (err) {
        data["error"] = err;
      } else {
        data["watershed"] = result.rows[0].name1; 
      }
      done();
      res.send(data);
    });
   }
  });
};
