var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response) {
	var json_companies = JSON.stringify(companies);
	var path = request["url"];
	var paths = path.split("/");
	if (path == "/") {
		response.end(json_companies);
	}

	else if (paths[1] == "google") {
		response.end(JSON.stringify(companies[1]));
	}

	else if (paths[1] == "apple") {
		response.end(JSON.stringify(companies[0]));
	}

	else {
		console.log("Bad Path.")
		response.end("");
	}

})

server.listen(2000);