var http = require('http');
var fs = require('fs');

var cast_member = ["A", "B", "C", "D", "E", "F", "G", "H"]

var server = http.createServer(function(request, response) {
	
	var path = request["url"]
	var name_path = request["url"].split("=")[0]
	var create_member = request["url"].split("?")[0]

	if (path == '/') {

		var html = fs.readFileSync('index.html')
		response.end(html);

	} else if (path == '/styles.css') {

		var css = fs.readFileSync('styles.css')
		response.end(css);

	} else if (path == '/cast' && request["method"] == "GET") {

		var html = ""
		for (i=0; i<cast_member.length; i++) {
			html = html + "<li>" + cast_member[i] + "</li>"
		};
		html = "<html><head></head><body><ul>" + html + "</ul></body></html>"
		response.end(html);

	} else if (path == '/cast/random') {

		var list = []
		for (i=0; i<cast_member.length; i++) {
			list.push(cast_member[i])
		};
		var random_member = list[Math.floor(Math.random()*list.length)];
		response.end(random_member);

	} else if (name_path == '/hello?name'){

		name = path.split('=')[1];
		name = "<h1>" + name + "</h1>";
		response.end(name);

	} else if (path == "/cast/new") {

		var html = fs.readFileSync('castnew.html');
		response.end(html);

	} else if (path == "/cast" && request["method"] == "POST") {

		var body = "";
		request.on('data', function(chunk) {
			body += chunk;
		});
		request.on('end', function(){

		console.log("POSTED: " + body);
		name = body.split("=")[1]
		cast_member.push(name)
		var html = fs.readFileSync('index.html')
		response.end(html);

		});
	} else {

		response.end("<h1>Error!</h1>");

	};
});

server.listen(2000);