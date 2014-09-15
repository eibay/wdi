var people = [];
function createPerson() {
	var first = ["Jimmy", "Johnny", "Joey", "Mickey", "Marky", "Monty", "Sonny", "Billy", "Sammy"];
	var last = ["McGee", "Smith", "Doe", "McCall", "McGuinness", "Maguire", "Madison", "Withers", "White"];
	var person = first[Math.floor(Math.random() * first.length)] + " " + last[Math.floor(Math.random() * last.length)]
	return person;
}

console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
