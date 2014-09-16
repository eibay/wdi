var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];


var findCompanyByName = function(array, name) {
	var output = null
	array.forEach(function(company) {
		if (name == company["name"]) {
			output = company
		}
	})
	return output
}

var comp = findCompanyByName(companies, "google");
console.log(comp)