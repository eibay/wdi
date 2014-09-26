//++1 Create a server that just returns "Hello World" (for every route)
//++2 Route that returns Hello World wrapped in a marquee tag
//++3 Route that returns Hello World in a marquee tag, but read from a file
//++4 Change the hello world route to '/hello'
//++5 Add a route '/yo' that says "yo world" (with no additional files)
//++6 Add CSS to style the hello route, but no CSS in a file
//++7 Every route returns an array of names, in json
//++8 Every route returns json of names that was returned from a function

//9 Every route calls a function that returns an array of 3 people, where each person is represented by a hash of attributes (e.g. name, age, etc)
//10 Two routes - one for names, one for people
//11 Use the node-simple-router library to simplify the above
var http = require('http');
var url = require('url');
var request = require('request');
var fs = require('fs');

var people = [{name: "Eddie", age: 36, favorite: "beer"}, {name: "Becky", age: 32, favorite: "laboutins"}, {name: "Pasha", age: 10, favorite: "ballet"}, {name: "David", age: 6, favorite: "destruction"}]

var server = http.createServer(function(req, response) {
	console.log(req.url);
	if (req.url == '/hello') {
		response.end(returnPeople(people));
	}
	else if (req.url == '/yo') {
		response.end(returnPeople(people));
	}
	else response.end('error');

});
server.listen(2000);

function returnPeople(array) {
	var new_people = [];
	for (var i=0; i < array.length; i++) {
		new_people.push(array[i]);
	}
		
		return JSON.stringify(new_people);
}

function returnNames(array) {
	var namesResult = JSON.stringify(array);
	return namesResult;
}


