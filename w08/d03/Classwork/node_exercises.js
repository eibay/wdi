// // Create a server that just returns "Hello World" (for every route)

var http = require('http');

var server = http.createServer(requestFunc)
server.listen(4567);

function requestFunc(request, response) {
	response.end("hello world")
};

// // Route that returns Hello World wrapped in a marquee tag

var http = require('http');

var server = http.createServer(requestFunc)
server.listen(4567);

function requestFunc(request, response) {
	var path = request.url

	if (path == "/") {
	response.end("<html><marquee> hello world </marquee></html>")
	}
};

// // Change the hello world route to '/hello'

var http = require('http');

var server = http.createServer(requestFunc)
server.listen(4567);

function requestFunc(request, response) {
	var path = request.url

	if (path == "/hello") {
	response.end("<html><marquee> hello world </marquee></html>")
	}
};

// // Add a route '/yo' that says "yo world" (with no additional files)

var http = require('http');

var server = http.createServer(requestFunc);
server.listen(4567);

function requestFunc(request, response) {
var path = request.url;

	if (path =="/yo") {
	response.end("yo world");
	}
};

// // Every route returns an array of names, in json

var http = require('http');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(request, response) {
	var arr_num = [1,2,3,4,5]

	response.end(JSON.stringify(arr_num))
};

// // Every route returns json of names that was returned from a function

var http = require('http');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(request, response) {
	response.end(JSON.stringify(arr_num()))
};

function arr_num() {
	return [1,2,3,4,5];
}

// // Every route calls a function that returns an array of 3 people, where each person is represented by a hash of attributes (e.g. name, age, etc)

var http = require('http');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(request, response) {
	response.end(JSON.stringify(arr_name()))
};

function arr_name() {
	return [
		{
			name: "jeff",
			age: 28
		},
		{
			name: "ray",
			age: 93
		}
	]
}