

// require in ruby attaches to the scope of the object

// in js you need to save it to variable to hold onto it

var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response) {

	console.log("Connection from client has been made")

	var path = request["url"];

	console.log("Client is attempting to reach the " + path + " route");

	if (path == "/") {
		var html = fs.readFileSync("./index.html")
		response.end(html);
	}	

	else if (path == "/cast") {
		var cast = ['Jennifer Aniston', 'Courteney Cox', 'Lisa Kudrow', 'Matt LeBlanc', 'Matthew Perry', 'David Schwimmer'];
		var taggedString = []
		i = 0;

		while (i < cast.length) {
			taggedString.push('<li>' + cast[i]+ '</li>');
			i += 1;
		}

		var html = taggedString.join();
		html = html.replace(/,/g, '');
		
		response.end("<html><body><ul>" + html + "</ul></body></html>");
	}	

	else if (path == "/cast/random") {
		var rand = Math.floor(Math.random() * 5);
		var cast = ['Jennifer Aniston', 'Courteney Cox', 'Lisa Kudrow', 'Matt LeBlanc', 'Matthew Perry', 'David Schwimmer'];
		character = cast[rand];

		response.end("<html><body><h2>" + character + "</h2></body></html>");
	}	
	// path = 'hello?name=yaniv'
	// path needs to be '/hello'
	else if (path == "/hello") {
		var name = request.url;

		response.end("hello world");
	}

	else if (path == "/styles.css") {
		var css = fs.readFileSync("./styles.css")
	}

	else {
		response.end("Sorry Dude!");
	}
		
});

server.listen(2000);

