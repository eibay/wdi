// Create a server that just returns "Hello World" (for every route)
// Route that returns Hello World wrapped in a marquee tag
// Route that returns Hello World in a marquee tag, but read from a file
// Change the hello world route to '/hello'
// Add a route '/yo' that says "yo world" (with no additional files)
// Add CSS to style the hello route, but no CSS in a file
// Every route returns an array of names, in json
// Every route returns json of names that was returned from a function
// Every route calls a function that returns an array of 3 people, 
//     where each person is represented by a hash of attributes (e.g. name, age, etc)
// Two routes - one for names, one for people
// Use the node-simple-router library to simplify the above

var http = require("http");
var fs = require("fs")

var server = http.createServer(function(request, response) {
	console.log("Client is connected");
	var array = ["Bob", "Emily", "Linda"]
	function jasonify(arr) {
		return JSON.stringify(arr)
	};
	array = jasonify(array)
  function ppl(){
  	return [{"name": "Bob", "age": 40}, {"name": "Wendall", "age": 50}
  }
	var path = request["url"];

	console.log("Client is attempting to reach" + path)

	if (path == "/hello") {
	response.end("<html><h1 style='color: red'>Hello World</h1>" + array);
	
	} else if (path == "/marquee1") {
	response.end("<html><marquee>Hello World</marquee>");
	
	} else if (path == "/marquee2") {
	response.end(fs.readFileSync("./marquee.txt"));
	
	} else if (path == "/yo") {
	response.end("yo world");
	
	}


});

server.listen(2000);