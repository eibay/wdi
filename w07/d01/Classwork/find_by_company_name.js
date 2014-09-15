var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var findCompanyByName = function(name, info) {
	info.forEach function(companies) {
		if (companies["name"] == name) { 
			return companies["name"]
	}
}
}
