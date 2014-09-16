var http = require('http');
var fs = require("fs");


var server = http.createServer(function(request, response){
  var path = request['url'];
  var firstAfterSlash = path.split("/")[1]
  console.log(path)
  var msg = "";
  if (path == "/"){
	  companies_in_json = JSON.stringify(companies);
	  msg = companies_in_json;
	}else if (path == "/" + firstAfterSlash){
		msg = JSON.stringify(findCompanyByName(firstAfterSlash));
	}
	response.end(msg);
});

server.listen(2000);


var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];
array = []

var findCompanyByName = function(compName){
	i=0 
	while (i<companies.length){
		if (compName == companies[i]["name"]){
			array.push(companies[i])
		}i++
	} return array
}