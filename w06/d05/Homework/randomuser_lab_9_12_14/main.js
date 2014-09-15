var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
<<<<<<< HEAD
	
=======
>>>>>>> 02bfb265fe5f7fc39e4f0ab2cc6d4d014455693f
	companies_in_json = JSON.stringify(companies);
	response.end(companies_in_json);
});

server.listen(2000);
