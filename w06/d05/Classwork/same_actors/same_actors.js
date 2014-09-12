var fs = require('fs');

var titanic = fs.readFileSync('./titanic.txt').toString();
var inception = fs.readFileSync('./inception.txt').toString();

titanic = titanic.split(", ");
inception = inception.split(", ");

function findActor(first, second){
  for (var i = 0; i < first.length; i++){
    var actor = first[i];
    for (var i = 0; i < second.length; i++){
      var other_actor = second[i];
      if (actor == other_actor){
        console.log(actor);
      }
    }
  }
};

findActor(titanic, inception);
