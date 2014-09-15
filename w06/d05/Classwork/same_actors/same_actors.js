var fs = require("fs")


var titanic = fs.readFileSync("./titanic.txt").toString();
var inception = fs.readFileSync("./inception.txt").toString();
debugger
titanic = titanic.split(", ")
inception = inception.split(", ")



var findCharacters = function(array1, array2){
	var similar=[]
	array1.forEach(function(actor){
		array2.forEach(function(other_actor){
			if (actor == other_actor){
				similar.push(actor);
			}; 
		});
	});return similar
};


console.log(findCharacters(titanic, inception));

// console.log(findCharacters(titanic, inception))
