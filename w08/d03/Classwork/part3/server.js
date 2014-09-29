// Node server - every route returns html (no files) that console.logs your name.
// Modify this server to have two routes, one that serves html with just a body and script tag, and another route that serves a javascript file
// Your javascript make an ajax call to the names route from the previous section - console.logs the whole result
// Now, have your javascript make a <ul> in memory that contains all of the names
// Append this to the DOM
// Create a function that reverses the list.

var http = require('http');
var server = http.createServer(function(request, response){
var path = request['url']
		console.log(path)

var greeting = "<h1>Hello, Brenda!</h1>"

console.log(greeting);
response.end(greeting);

if path == ('/')
	html = "<html><body>Hello!</body></html>"
response.end(html);

});

server.listen(2000);

