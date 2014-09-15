var people = []
function createPerson() {
	var names = ["abby", "bertha", "carol", "declan", "edward", "fred", "greta", "heloise"];
	var hoods = ["upper east", "lower east", "carrol gardens", "jackson heights", "tribeca", "staten island"]
	var person = 
		{name: names[Math.floor(Math.random() * names.length)],
		hood: hoods[Math.floor(Math.random() * hoods.length)],
		}
		return person

}

console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());