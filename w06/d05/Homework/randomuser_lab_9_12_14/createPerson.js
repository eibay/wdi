var people = []
var characters = [
	{name: "Fred Flinstone", id: "1"},
	{name: "Barey Rumble", id: "2"},
	{name: "Steve Rogers", id: "3"},
	{name: "Bruce Wayne",  id: "4"},
	{name: "Frodo", id: "5"},
	{name: "Homer Simpson", id: "6"}
]

var names = ["arrol", "barrel", "carol", "daryl", "errol", "ferrel", "garyl", "Jeryl"]

console.log(people)

function createPerson() {
	person = {}

	person["name"] = names[Math.floor(Math.random() * (names.length))]
	person["id"] = names.length + 1
	people.push(person)
	return person
}

console.log(createPerson())
console.log(createPerson())
console.log(createPerson())
console.log(createPerson())
console.log(createPerson())
console.log(people)