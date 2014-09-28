var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
var path = request['url'];
		console.log(path)
var greeting = "<h1 style='font-family: Helvetica'>Hello World!</h1>"
var marquee = "<html><marquee><h1 style='font-family: Helvetica'>Hello World!</h1></marquee></html>"
var yo = "<h1>Yo world!</h1>"

var namesArray = ["Peter", "Paul", "Mary"]


function makeJSON(arr) {
	var names = JSON.stringify(arr);
	return names	
}

		if (path == "/hello") {
			response.end(greeting + makeJSON(names)); 
		} else if (path == "/marquee"){
			response.end(marquee + makeJSON(names));
		} else if (path == "/marquee2"){
			var html = fs.readFileSync("./marquee.html")
			response.end(html); 
		} else if (path == '/yo') {
			response.end(yo + makeJSON(names));
		} else {
			response.end(greeting);
		};
});


server.listen(2000);

Every route calls a function that returns an array of 3 people, where each person is represented by a hash of attributes (e.g. name, age, etc)