var http = require('http');
var router = require('node-simple-router')();
var server = http.createServer(router);

var namesArray = ["Peter", "Paul", "Mary"]
var attrHash = [{name: "Peter", role: "singer"}, {name: "Paul", role: "Also a singer"}, {name: "Mary", role: "Yet another singer" }]

	router.get("/names", function(request, response) {
	response.end(makeJSON(namesArray));
})

	router.get("/people", function(request, response) {
	response.end(returnAttributes(attrHash));
})

server.listen(2000);

function makeJSON(arr) {
	var names = JSON.stringify(arr);
	return names	
}

function returnAttributes(arr) {
var newArray = [];
	for (var i=0; i < arr.length; i++) {
		newArray.push(arr[i]);
	}		
	return JSON.stringify(newArray);
}