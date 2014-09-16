var people = []
var characters = ["Ted Mosby", "Peter Griffin", "Corey Matthews", "Homer Simpson"]

function createPerson () {

	person = {}
	person.characters = randomElement(characters);
	person.id = people.length +1 ;

	people.push(person);

	return person
	}
	
function randomElement(array) {
	var index = Math.floor(Math.random() * array.length);
	return array[index];

	}
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());

