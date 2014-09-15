var friends = ["Joey", "Phoebe", "Chandler", "Rachel", "Monica", "Ross"];

var list_all = function(name){
	console.log("I love the character " + name);
};


var myEach = function(array, my_function){

	for(var i = 0; i < array.length; i++){
		my_function(array[i]);
	};

};

myEach(friends, list_all);