var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];


var server = http.createServer(function(request, response){
	
	var path = request["url"];

	if (path == '/'){
		companies_in_json = JSON.stringify(companies);
		response.end(companies_in_json);
	}else{
		var name = path.split('/')[1]

		companies.forEach(function(company){
			if(company['name'] == name){
				company_hash = JSON.stringify(company);
				response.end(company_hash);
			};
		});
	
	};


});

server.listen(2000);
