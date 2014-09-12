var fs = require ('fs')

var titanic = (fs.readFileSync('./titanic.txt')).toString()
var inception = (fs.readFileSync('./inception.txt')).toString()

function splitter(movie){
  return movie.split(", ")
}

function compare(splitter, titanic, inception) {
  var arrayofmovie1 = splitter(titanic)
  var arrayofmovie2 = splitter(inception)
  var similar = []
  arrayofmovie1.forEach(function(actortitanic){ 
    if (arrayofmovie2.indexOf(actortitanic) != -1) { 
      similar.push(actortitanic)  
    };
  });
return similar
};

function compare2(splitter, titanic, inception){
  var arrayofmovie1 = splitter(titanic)
  var arrayofmovie2 = splitter(inception)
  var similar = []
  arrayofmovie1.forEach(function(actortitanic){
      arrayofmovie2.forEach(function(actorinception){
        if (actorinception == actortitanic){
          similar.push(actortitanic)
        };
      });
  });
return similar
};

console.log(compare(splitter, titanic, inception))
console.log(compare2(splitter, titanic, inception))