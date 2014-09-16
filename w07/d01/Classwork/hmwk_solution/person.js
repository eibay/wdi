var people = []
function createPerson() {
	//create a person with random attributes
	//add that person to the people array
	//return that person

	var hairs = ["white", "brown", "blonde", "red"];
	var vests = ["denim", "leather", "classic"];

	person = {}
	person.hair = randomElement(hairs);
	person.vest = randomElement(vests);

	people.push(person);

	return person;
}

function randomElement(arr) {
	var index = parseInt(Math.random() * arr.length);
	return arr[index];
}

console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());