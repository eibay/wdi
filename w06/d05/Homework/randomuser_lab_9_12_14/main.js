var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];
companies_in_json = JSON.stringify(companies);

var server = http.createServer(function(request, response){
	


	var path = request["url"]

	if(path == "/") {
		response.end(companies_in_json);
	}

	else if(path == "/apple") {
		var company = companies[0]
		company_in_json = JSON.stringify(company)

		response.end(company_in_json)
	}
	else if(path == "/google") {
		var company = companies[1]
		company_in_json = JSON.stringify(company)

		response.end(company_in_json)
	}

})

server.listen(2000);
