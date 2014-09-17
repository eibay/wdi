var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
  companies_in_json = JSON.stringify(companies);
  response.end(companies_in_json);
});

server.listen(2000);

function findByName(name) {
	for(var i=0; i<companies.length; i++){
	
	if (companies[i].name == name) {
		return companies[i]; 
    }
  }
  return {};
}