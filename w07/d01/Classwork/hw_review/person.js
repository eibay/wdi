var people = []

function createPerson() {
	var names = ["Joe", "Bob", "Arnold", "Goku"];
	var ages = ["20", "30", "40", "80"];

	var name = randomize(names);
	var age = randomize(ages);

	var new_char = {name: name, age: age, id: (characters.length + 1)}
	characters.push(people);

	return new_char
}

function randomize(arr) {
	var element = arr[Math.floor(arr.length * Math.random())];
	return element;
}



console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());