var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];
var msg = "";
var findCompanyByName = function(path, arr) {
	for (i=0; i < arr.length; i++) {
		if (path == arr[i]["name"]) {
			msg = arr[i]
		} else msg = "name not found"
	}
	return msg
}

var server = http.createServer(function(request, response){
	var path = request["url"];
	console.log(path)

	
	var firstAfterSlash = path.split("/")[1]

	if (path = "/") {
  companies_in_json = JSON.stringify(companies);
  msg = companies_in_json
	} else if (path == "/" + firstAfterSlash) {
		msg = findCompanyByName(firstAfterSlash, companies);
	}
  response.end(companies_in_json);
});

server.listen(2000);