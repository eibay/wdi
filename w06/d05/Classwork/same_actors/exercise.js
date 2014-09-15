var fs = require('fs');

var inception = fs.readFileSync("./inception.txt").toString();
var titanic = fs.readFileSync("./titanic.txt").toString();
debugger
var inception_array = inception.split(", ");
var titanic_array = titanic.split(", ");



var sameActor = function(array1, array2){

	for(var i = 0; i < array1.length; i++){
		
		for(var x=0; x < array2.length; x++){
			if(array1[i] == array2[x]){
				console.log(array1[i]);
			};
		};

	};	

};



var sameActor2 = function(array1, array2){

	array1.forEach(function(actor){
		if(array2.indexOf(actor) != -1){
			console.log(actor)
		};
	});
};




var sameActor3 = function(array1, array2){

	array1.forEach(function(actor){

		array2.forEach(function(actor2){
			if(actor == actor2){
				console.log(actor);
			};

		});

	});

};

sameActor(inception_array, titanic_array);
sameActor2(inception_array, titanic_array);
sameActor3(inception_array, titanic_array);












