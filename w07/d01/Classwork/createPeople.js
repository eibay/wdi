var fs = require("fs")

path = "/Users/farberge/dev/wdi/Rosencrantz/w06/d05/Homework/randomuser_lab_9_12_14/part_two/"



var people = [];

var first_names = JSON.parse(fs.readFileSync(path + "first_names.txt", "UTF8"));
var last_names = JSON.parse(fs.readFileSync(path + "last_names.txt", "UTF8"));
var locations = JSON.parse(fs.readFileSync(path + "locations.txt", "UTF8"));

debugger;	

function createPerson() {
	var person = createUser();
	people.push(person);
	return people;
}

function extractRandomly(array) {
	rand = Math.floor(Math.random() * array.length);
	return array[rand];

}

function createUser() {
	var user = {
		"first": extractRandomly(first_names),
		"last": extractRandomly(last_names),
		"location": extractRandomly(locations),
		"id": people.length,
	}
	return user;
}


console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());



