//11 Use the node-simple-router library to simplify the above
var http = require('http');
var url = require('url');
var request = require('request');
var fs = require('fs');
var Router = require('node-simple-router');
var router = Router();

var people = [{name: "Eddie", age: 36, favorite: "beer"}, {name: "Becky", age: 32, favorite: "laboutins"}, {name: "Pasha", age: 10, favorite: "ballet"}, {name: "David", age: 6, favorite: "destruction"}]

router.get("/hello", function(request, response) {response.end("Hello, World!")
}


var server = http.createServer(router);



// var server = http.createServer(function(req, response) {
// 	console.log(req.url);
// 	if (req.url == '/names') {
// 		response.end(returnNames(people));
// 	}
// 	else if (req.url == '/people') {
// 		response.end(returnPeople(people));
// 	}
// 	else response.end('error');

// });

});
server.listen(2000);

function returnNames(array) {
	var names = [];
	for (var i=0; i < array.length; i++) {
		names.push(array[i]["name"]);

	}
	var namesResult = JSON.stringify(names);
	return namesResult;
}


function returnPeople(array) {
	var new_people = [];
	for (var i=0; i < array.length; i++) {
		new_people.push(array[i]);
	}
		
		return JSON.stringify(new_people);
}


