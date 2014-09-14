var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){

	// debugger
	console.log("Connection from client has been made")

	var path = request["url"];

	console.log("Client is attempting to reach the " + path + " route");
	
	if(path == '/'){
		var companies = [
  		{name: "apple", location: "cupertino"},
  		{name: "google", location: "mountain view"}
		];

		var companies_in_json = JSON.stringify(companies);
		response.end(companies_in_json);
	} 

	else if (path == "/styles.css"){
		var css = fs.readFileSync("./styles.css")
		response.end(css);
	} 

	else {
		response.end("<h1>ERROR</h1>");
	};

});

server.listen(2000);

	var path = "/apple";
	var comp = path.split("/")[1];
	var method = request["method"];

	console.log("Client is attempting to reach the " + path + " route");
	console.log(request);

	var companies = [
  	{name: "apple", location: "cupertino"},
  	{name: "google", location: "mountain view"}
	];

	else if(path == "/" + comp){
		for (var i = 0; i < companies.length; i++) {
	  	company = companies[i];

			if(company["name"] == comp){
				var company_in_json = JSON.stringify(company);
				response.end(company_in_json);
			}
		}
	}


// var http = require('http');

// var companies = [
//   {name: "apple", location: "cupertino"},
//   {name: "google", location: "mountain view"}
// ];

// var server = http.createServer(function(request, response){
//   companies_in_json = JSON.stringify(companies);
//   response.end(companies_in_json);
// });

// server.listen(2000);

// -----------
// else if(req.url.split("?")[0]=="/hello"){
// 	var str=req.url.split("=");
// 	output="<html><head><link rel='stylesheet' type='text/css' href='./style.css'></head><body><h1>Hello "+str[1]+"</h1></body></html>";
// 	res.end(output)
// }