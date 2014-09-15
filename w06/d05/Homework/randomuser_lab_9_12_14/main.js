var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
  companies_in_json = JSON.stringify(companies);

var path = request["url"];

if(path == "/") {
	response.end(companies_in_json);
} else if(path.length > 1) {
	var name = path.split("/")[1];
	var company = "";
	for (var i = 0; i < companies.length; i++) {
		if(companies[i]["name"] ==  name) {
			company = companies[i];
		}
	}
	response.end(JSON.stringify(company));
} 
});

server.listen(2000);
