var fs = require('fs');

var titanic = fs.readFileSync('./titanic.txt').toString();
var inception = fs.readFileSync('./inception.txt').toString();

var titanic_actors = titanic.split(', ');
var inception_actors = inception.split(', ');

var similar = [];

// var i = 0;

// while (i < titanic_actors.length) {
//   var actor = titanic_actors[i];

//   var j = 0;
//   while (j < inception_actors.length) {
//     var other_actor = inception_actors[j];
//     if (actor == other_actor) {
//       similar.push(actor);
//     }
//     j++
//   }
//   i++
// }

// inception_actors.forEach(function(actor) {

//   titanic_actors.forEach(function(other_actor) {
//     if (actor == other_actor) {
//       similar.push(actor);
//     };
//   });
// });

for (var i = 0; i < titanic_actors.length; i++) {
  actor = titanic_actors[i];

  // for (var j = 0; j < inception_actors.length; j++) {
  //   other_actor = inception_actors[j];
  //   if (actor == other_actor) {
  //     similar.push(actor);
  //   }
  // }

  if ( inception_actors.indexOf(actor) != -1 ) {
    similar.push(actor);
  }
};

// inception_actors.forEach(function(actor) {
//   if (titanic_actors.indexOf(actor) != -1) {
//     similar.push(actor);
//   }
// });


console.log(similar);

