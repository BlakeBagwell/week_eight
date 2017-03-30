var pgp = require('pg-promise')();

var db = pgp({
  host: '52.37.117.62',
  database: 'music_database',
  user: 'postgres',
  password: '1Tape2beard3'
});

db.any("select * from people")
  .then(function(result) {
    console.log(result);
    pgp.end();
  })
  .catch(function(err) {
    console.log(err.message);
  });
