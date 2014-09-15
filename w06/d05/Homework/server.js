//Part1


var http = require('http');


var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];



var server = http.createServer(function(request, response){
var path = request["url"]

  companies_in_json = JSON.stringify(companies);
  companies_in_json_0 =JSON.stringify(companies[0]);
  companies_in_json_1 =JSON.stringify(companies[1]);

  if (path == "/"){
 	 response.end(companies_in_json);
 	}
 	else if (path == "/apple"){
 		response.end(companies_in_json_0)
 	}
 	else if (path == "/google"){
 		response.end(companies_in_json_1)
 	}
 	else 
 		response.end("error")
});

server.listen(2000);