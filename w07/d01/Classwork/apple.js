var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

function findCompanyByName(path) {
	for (var i=0; i < companies.length; i++) {
		if (path == companies[i].name) {
				console.log(companies[i])
		return companies[i]
		}
	}
}

var server = http.createServer(function(request, response){
	var path = request["url"];
	console.log(path)

	var msg = "";
	var firstAfterSlash = path.split("/")[1]

	if (path == "/") {
  companies_in_json = JSON.stringify(companies);
  msg = companies_in_json
	} else if (path == "/" + firstAfterSlash) {
		msg = findCompanyByName(firstAfterSlash);
		msg = JSON.stringify(msg)
	}
  response.end(msg);
});

server.listen(2000);