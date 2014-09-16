var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){

var path = request['url'];

 if(path == "/") {
	companies_in_json = JSON.stringify(companies);
 	response.end(companies_in_json);
 }
 else if (path == "/apple"){
 	companies_in_json = JSON.stringify(companies[0]);
 	response.end(companies_in_json);
 }
  else if (path == "/google"){
 	companies_in_json = JSON.stringify(companies[1]);
 	response.end(companies_in_json);
 }
});

server.listen(2000);