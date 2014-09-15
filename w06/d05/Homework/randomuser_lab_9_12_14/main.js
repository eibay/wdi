var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
	console.log("connection made")

var path = request['url'];
console.log("client is attempting to reach " + path + " route");
			// debugger

if (path == '/') {
	companies_in_json = JSON.stringify(companies);
	response.end(companies_in_json);
}
else if (path.split('/').length == 2) {
	var company;
	for (var i = 0; i < companies.length; i++) {
		if (path == "/" + companies[i]["name"]) {
			// debugger
			company = JSON.stringify(companies[i]);
			response.end(company);
		}
	}
}




});

server.listen(2000);
