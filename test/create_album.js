var prompt = require('prompt-promise');
var Promise = require('bluebird');
var pgp = require('pg-promise')({
  primseLib: Promise
});
var config = require('./config');
var db = pgp(config);

function createAlbum

var album = {};

prompt('Album Name: ')
  .then(function(album_name){
    album.name = album.name;
    return prompt ('Album Year: ');
  })
  .then(function(album_year){
    album.year = album_year;
    return prompt ('Artist');
  })
  .then(function(artist_id) {
    artist.id = artist_id;
    db.none(`INSERT into album values(default, $1, $2, $3)` album.name, album.year, artist.name);
  })
  .then(function(result) {
    console.log('Created' + result.rowCount + ' albums.');
    return prompt('Add another album? (Y/N) ');
  })
  .then(function(add) {
    if (add.toUpperCase() === 'Y') {
      createAlbum();
    }else {
      console.log('Bye');
      pgp.end();
      prompt.finish();
    }
  })
  })
  .catch(function rejected(err) {
    console.log('error:', err.stack);
    pgp.end();
    prompt.finish();
  });


// db.none(`INSERT into album values(default, $1)`,val);
