var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];
var companies_in_json = JSON.stringify(companies);
var server = http.createServer(function(request, response){
	var path = request["url"];
	var destination = path.split("/")[1]
	if (path == "/") {
			response.end(companies_in_json);
	} else if (path == "/" + destination) {
			var company_array = [];
			function find_company_by_name(name) {
			for (i = 0; i < companies.length; i++) {
				if (companies[i]["name"] == destination) {
					company_array.push(companies[i]);
					var company_array_injson = JSON.stringify(company_array);
					return company_array_injson}}}
					
					response.end(find_company_by_name(destination));
	} else {
					response.end("Error. Company is not in database");
				}
				
		
	
});

server.listen(2000);