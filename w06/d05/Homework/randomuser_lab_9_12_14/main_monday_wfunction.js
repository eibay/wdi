var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
	console.log("connection made")

var path = request['url'];
console.log("client is attempting to reach " + path + " route");
var msg = "";
var firstAfterSlash = path.split('/')[1];

function findCompanyByName(firstAfterSlash) {
	for (var i = 0; i < companies.length; i++) {
		if (firstAfterSlash == companies[i]["name"]) {
			company = JSON.stringify(companies[i]);
			return company;
		}
	}
}

if (path == '/') {
	companies_in_json = JSON.stringify(companies);
	msg = companies_in_json;
}
else if (path == "/" + firstAfterSlash) {
	msg = findCompanyByName(firstAfterSlash);
		}
	
response.end(msg);



});

server.listen(2000);
