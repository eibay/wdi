var people = [{name:"jeff", location:"new york"}, {name:"sean", location:"tokyo"}, {name:"neel", location:"london"}]
function createPerson() {
	//create a person with random attributes
	//add that person to the people array
	//return that person
	person = people.shuffle[0]

	var name = person.name
	var location = person.location
	var person = {name:name, location:location};
	people.push(person)
	return person
};

console.log(createPerson());