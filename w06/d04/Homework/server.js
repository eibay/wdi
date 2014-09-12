var http = require('http');
var fs = require('fs');
var cast = ["Jennifer Aniston", "David Schwimmer", "Courtney Cox", "Matthew Perry", "Lisa Kudrow", "Matt Leblanc"];

var server = http.createServer(function(req, res) {
	var path = req.url;

	res.writeHead(200, {'Content-Type': 'text/html'});
	if(path == "/") {
		var html = fs.readFileSync("./index.html");
		res.end(html);
	} else if(path == "/style.css") {
		res.writeHead(200, {'Content-Type': 'text/css'});
		var css = fs.readFileSync("./style.css");
		res.end(css);
	} else if(req.method == "GET" && path == "/cast") {
		var html = "<html><head><link rel='stylesheet' href='./style.css'></head><body>";
		html += "<h1>Cast</h1><ul>"
		for (var i = 0; i < cast.length; i++) {
			html = html + "<li>" + cast[i] + "</li>"
		} 
		html = html + ("</ul></body></html>");
		res.end(html);
	} else if(path == "/cast/random") {
		var member = cast[Math.floor(Math.random() * cast.length)];
		var html = "<html><head><link rel='stylesheet' href='../style.css'></head><body>";
		html = html + "<h1>Random Cast Member: " + member + "</h1></body></html>";
		res.end(html);
	} else if(path == "/hello") {
		html = fs.readFileSync("./hello.html");
		res.end(html);
	} else if(path.split("?")[0] == "/hello/") {
		var name = path.split("=")[1];
		var html = "<html><head><link rel='stylesheet' href='../style.css'></head><body>";
		html += "<h1>Hello " + name + "!</h1></body></html>"
		res.end(html);
	} else if(path == "/cast/new") {
		var html = fs.readFileSync("./cast_add.html");
		res.end(html);
	} else if(req.method == "POST" && path == "/cast") {
		var body = "";

		req.on('data', function(chunk) {
			body += chunk;
		});

		req.on('end', function(){
			console.log("POSTED: " + body);
			var name = body.split("=")[1].split("+").join(" ")
			cast.push(name);
		});
		var html = "<html><head><link rel='stylesheet' href='./style.css'></head><body>";
		html += "<h1>Cast</h1><ul>"
		for (var i = 0; i < cast.length; i++) {
			html = html + "<li>" + cast[i] + "</li>"
		} 
		html = html + ("</ul></body></html>");
		res.end(html);
	} else if(path == "/photo") {
		var html = fs.readFileSync("./photo.html");
		res.end(html);
	} else if(path.split("?")[0] == "/photos") {
		var tag = path.split("=")[1];

		var Client = require('node-rest-client').Client;

		client = new Client();

		var instagram = client.get("https://api.instagram.com/v1/tags/" + tag + "/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2&count=4", function(data, response){
      // parsed response body as js object
      console.log(data);
      // raw response
      console.log(response);

		var parsed = JSON.parse(data);

		var arr = [];

		for(var x in parsed){
	  	arr.push(parsed[x]);
		}

		var images = "";
		for(var i = 0; i < arr.length; i++) {
			images = images + "<img src='" + arr[2][i].images.standard_resolution.url + "'>";
		}
		res.end(images)
				debugger
		});
	} else {
		res.end("error")
	}
});

server.listen(2000)