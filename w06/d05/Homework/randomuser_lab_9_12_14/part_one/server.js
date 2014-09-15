var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
	
	companies_in_json = JSON.stringify(companies);

	var path = request["url"];

	if (path == "/") {

		response.end(companies_in_json);

	} else if (path != "/") {

		name = path.split('/')[1]
		companies_json_parse = JSON.parse(companies_in_json)
		companies_json_parse.forEach(function(thing) {
			if (thing["name"] == name) {
				debugger
				thing = JSON.stringify(thing)
				response.end(thing);
			};
		});
	};
});

server.listen(2000);







