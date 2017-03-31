// Make an express program that will display "Hello, world!" at the root URL: /

const express = require('express');
const app = express();


var animals = [
  { name: 'cats', favorite: true },
  { name: 'dogs', favorite: true },
  { name: 'tree frogs', favorite: true },
  { name: 'earth worms', favorite: false },
  { name: 'guinea pigs', favorite: true },
];

app.set('view engine', 'hbs');

app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.get('/cats', function (req, res) {
  res.send('Meow');
});

app.get('/dogs', function (req, res) {
  res.send('Woof!');
});

app.get('/cats_and_dogs', function (req, res) {
  res.send('Living together!');
});

// app.get('/greet/:name', function(req, res) {
//   var name = req.params.name;
//   res.send('Hello ' + name + '!');
// });

app.get('/year', function (req, res) {
  var age = req.query.age;
  res.send('You were born in ' + (2017 - age) + '!');
});

app.listen(3000, function() {
  console.log('Example app listening on port 3000!');
});


app.get('/greet/:name', function(req, response){
  var name = req.params.name;
  var age = req.query.age;
  response.render('hello.hbs', {
    title: 'Hello',
    name: name,
    year: (2017 - age)
  });
});

app.get('/fav_animals', function(req, response) {
  response.render('hello.hbs', {
    title: 'Hello',
    animals: animals,
  });
});
