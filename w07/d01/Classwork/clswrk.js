var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

function findCompanyByName(CompanyName){
	for(var i=0; i<companies.length; i++){
		if (CompanyName == companies[i]['name']){
			return companies[i];
		}
	}
}

console.log(findCompanyByName("google"));

var people = [];
function createPerson(){
	var name = ["Edgar", "Balthazar", "Bartholomew", "Lenore", "Clarice", "Gabrielle", "Maximillian", "Ebenezer", "Sage", "Giovanni", "Vladimir", ];
	var last = ["Rodriguez", "Whitfield", "Mansfield", "DiGuiseppe", "Dashevsky"];
	var location = ["Russia", "New York", "Spain", "Portugal"]

	var name_result = name[parseInt((Math.random() * name.length))];
	var last_result = last[parseInt((Math.random() * last.length))];
	var location_result = location[parseInt((Math.random() * location.length))];

	var person = {firstName: name_result, lastName: last_result, location: location_result}

	people.push(person);
	return person
};


console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(people);