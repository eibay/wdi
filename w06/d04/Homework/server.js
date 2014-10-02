var http = require ('http');
var fs = require ('fs');

var friendsArray = ['Joey', 'Monica', 'Chandler', 'Ross', 'Rachel', 'Phoebe'];

var server = http.createServer(function(req, res) {

	console.log("Connection with client has been made.")

	var path = req["url"];

	if (path == "/") {
		var html = fs.readFileSync('./main.html')
		res.end(html)
	} else if (path == "/cast" && req.method == "GET") {
		var cast = ""

		for (var i = 0; i < friendsArray.length; i ++) {
			cast =  cast + "<li>" + friendsArray[i] + "</li>"
		}

		castList = "<html><link rel='stylesheet' href='/style.css'><h1>The Cast of Friends</h1><ul>" + cast + "</ul></html>"
		res.end(castList);

	} else if (path == "/cast/random") {
		var castRand = friendsArray[Math.floor(friendsArray.length * Math.random())]
		var castRand = "<html><link rel='stylesheet' href='/style.css'><h1>You're random cast member is...</h1>" + "<h2>" + castRand + "</h2></html>"

		res.end(castRand);

	} else if (path.split("/")[1].split("?")[0] == "hello") {
		var name = path.split("?")[1].split("=")[1];
		res.end("<h1>Hello " + name + "</h1>");

	} else if (path == "/cast/new") {
		res.end(fs.readFileSync("./new.html"))
	
	} else if (path == "/cast" && req.method == "POST") {
		var body = "";
		
		req.on('data', function(chunk) {
			body += chunk;
		});

		req.on('end', function(){
			var name = body.split("=")[1]
			name = name.split("+")
			name = name.join(" ")

			friendsArray.push(name)

			var cast = ""

			for (var i = 0; i < friendsArray.length; i ++) {
				cast =  cast + "<li>" + friendsArray[i] + "</li>"
			}
			res.end("<html><link rel='stylesheet' href='/style.css'><h1>The Cast of Friends</h1><ul>" + cast + "</ul></html>");
		});

	} else if (path.split("/")[1].split("?")[0] == "photos") {

		tag = path.split("?")[1].split("=")[1]
		http.get("https://api.instagram.com/v1/tags/" + tag + "/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01", function(res) {
			res.end(res);

		})
		
	} else if (path == "/style.css") {
		var css = fs.readFileSync("./style.css")
		res.end(css);

	};




});

server.listen(2000)



