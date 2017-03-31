var pgp = require('pg-promise')();
var config = require('./config');

var db = pgp({
  host: config.host,
  database: config.database,
  user: config.user,
  password: config.password
});

db.any("select * from people")
  .then(function(result) {
    console.log(result);
    pgp.end();
  })
  .catch(function(err) {
    console.log(err.message);
  });
