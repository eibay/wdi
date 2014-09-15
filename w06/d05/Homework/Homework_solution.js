var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
  var path = request['url'];
  console.log(path)
  var msg = "";
  if (path == "/"){
	  companies_in_json = JSON.stringify(companies);
	  msg = companies_in_json;
	}response.end(msg);
});

server.listen(2000);