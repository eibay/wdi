var http = require("http")
var fs = require("fs")

var server = http.createServer(function(request, response){
	console.log("Connection with client has been made");

	var path = request["url"];

	console.log("Client is attempting to reach" + path);
	var cast_array = ["Matt LeBlanc", "Matthew Perry", "David Schwimmer", "Courtney Cox", "Jennifer Aniston", "Lisa Kudrow"];
	if (path == "/") {
		var index = fs.readFileSync('./index.html');
		response.end(index);
	} else if (path == "/cast") {
		var cast = "<html><h1>Cast</h1><ul> li </ul>"
		
		var cast_lis = []
		var li = "<li>name</li>"
			var n = 0;
			while (n < cast_array.length) {
				cast_lis.push(li.replace("name", cast_array[n]));
				n++;
			};

			cast = cast.replace("li", cast_lis.join());
			response.end(cast);
	}
	else if (path == "/cast/random") {
		var x = Math.floor(Math.random() * 6);
		var random = "<html><h1>Behold!  Your random cast member is:</h1> <p>" + cast_array[x] + "</p>";
		response.end(random);
	}
	else if (path.split("/")[1].split("?")[0] == "hello") {
		var name = path.split("/")[1].split("?")[1].split("=")[1];
		var greeting = "<html><h1>" + name + "</h1>";
		response.end(greeting)
	}
	else {
		response.end("Error 404. Page does not exist.");
	}
});

server.listen(2000);