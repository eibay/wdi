var people = []

function createPerson() {
	var names = ["Joe", "Bob", "Arnold", "Goku"];
	var ages = ["20", "30", "40", "80"];

	var name = names[Math.floor(names.length * Math.random())];
	var age = ages[Math.floor(ages.length * Math.random())];

	var new_char = {name: name, age: age, id: (characters.length + 1)}
	characters.push(people);

	return new_char
}

console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());