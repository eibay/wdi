var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];
var companies_in_json = JSON.stringify(companies);

var server = http.createServer(function(request, response){
	var path = request["url"];
	if (path == "/") {
			response.end(companies_in_json);
	} else if (path.split("/").length == 2) {
			
			var company = path.split("/")[1];
			var company_array = [];

			for (i = 0; i < companies.length; i++) {
				if (companies[i]["name"] == company) {
					company_array.push(companies[i]);
					var company_array_injson = JSON.stringify(company_array);
					response.end(company_array_injson);}}
	} else {
					response.end("Error. Company is not in database");
				}
				
		
	
});

server.listen(2000);
