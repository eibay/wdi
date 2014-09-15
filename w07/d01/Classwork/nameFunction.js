var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){

	function findCompanyByName(name) {
		companies.forEach(function(company) {
			if (company["name"] == name) {
				company_in_json = JSON.stringify(company);
				response.end(company_in_json);
			}
		});
	};

	var path = request['url'];
	var name = path.split("/")[1]

	if (path == "/") {
		companies_in_json = JSON.stringify(companies);
		response.end(companies_in_json);
	
	} else if (path == "/" + name) {
		findCompanyByName(name);
	}
});

server.listen(2000);