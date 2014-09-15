var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
	
	if(request.url == "/"){

	var companies_in_json = JSON.stringify(companies);
	response.end(companies_in_json);

}

	else if(request.url.split("/")[1]!=""){

		var company_name = request.url.split("/")[1]
		var company_hash = ""

			companies.forEach(function(company){

				if(JSON.stringify(company).match(company_name)){

						company_hash = company
				}
			});

		company_json = JSON.stringify(company_hash);
		response.end(company_json)

	}

});

server.listen(2000);
