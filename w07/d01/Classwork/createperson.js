var people=[];
var request=require('request');
function createPerson(array){
	var names=["Steve", "Conor", "John", "Loser", "Ben", "Laura", "OK", "Whatever"];
	var ages=[1,2,3,4,5,6,7,8,122,9999,409,692];
	var rand_name=Math.floor(Math.random() * (names.length));
	var rand_age=Math.floor(Math.random() * (ages.length));

	var person={name: names[rand_name], age: ages[rand_age]};

	array.push(person)
	return person;
}

console.log(createPerson());
console.log(people);



