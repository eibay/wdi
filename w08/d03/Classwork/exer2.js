//++1 Create a server that just returns "Hello World" (for every route)
//++2 Route that returns Hello World wrapped in a marquee tag
//++3 Route that returns Hello World in a marquee tag, but read from a file
//++4 Change the hello world route to '/hello'
//++5 Add a route '/yo' that says "yo world" (with no additional files)
//++6 Add CSS to style the hello route, but no CSS in a file
//++7 Every route returns an array of names, in json

//8 Every route returns json of names that was returned from a function
//9 Every route calls a function that returns an array of 3 people, where each person is represented by a hash of attributes (e.g. name, age, etc)
//10 Two routes - one for names, one for people
//11 Use the node-simple-router library to simplify the above
var http = require('http');
var url = require('url');
var request = require('request');
var fs = require('fs');

var names = ["Eddie", "Becky", "Pasha", "David"]

var server = http.createServer(function(req, response) {
	console.log(req.url);
	if (req.url == '/hello') {
		response.end(returnNames(names));
	}
	else if (req.url == '/yo') {
		response.end(returnNames(names));
	}
	else response.end('error');

});
server.listen(2000);

function returnNames(array) {
	namesResult = JSON.stringify(array);
	return namesResult;
}




