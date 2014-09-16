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

var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

function findByName(name) {
	for(var i=0; i<companies.length; i++) {
		if (companies[i].name == name) {
			return companies[i];
		}
	}
}

// var thecompany = findByName("apple");
// console.log (thecompany);
// // // // // // // // // // // // // // // // // 
console.log("apple = ") 
console.log(findByName("apple"));
console.log("google = ")
console.log(findByName("google"));
console.log("banana = ")
console.log(findByName("banana"));

