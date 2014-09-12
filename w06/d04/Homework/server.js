var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
	console.log("connection from client has been made")

	var castArray = ["Neil Patrick Harris", "Nathan Fillion", "Felicia Day", "Simon Helberg"];
	var path = request["url"];
	// var query = 
	debugger
	if(path == '/') {
		var html = fs.readFileSync("./index.html")
		response.end(html);
	}
	else if(path == '/cast') {
		lis = "<html><head><link rel='stylesheet' href='/style'></head> <body> <a href='/cast'>Cast</a><a href='/cast/random'>RandomCast</a><ul>"
		for(i=0; i < castArray.length; i++) {
			lis = lis + " <li>" + castArray[i] + "</li> "
		}
		lis = lis + "</ul> </body></html>"
		response.end(lis);
	}
	else if(path.split("?").length > 1) { //accounting for favicon
		if (path.split("?")[1].split("=")[0] == 'name') {
			var name = path.split("?")[1].split("=")[1]
			response.end("<h1>"+name+"</h1>");
		}
	}
	else if(path = '/cast/random') {
		var randomChar = "<html><head><link rel='stylesheet' href='/style'></head> <body> <a href='/cast'>Cast</a><a href='/cast/random'>RandomCast</a>"
		var randomChance = Math.floor(Math.random() * castArray.length);
		randomChar = randomChar + "<h1>" + castArray[randomChance] + "</h1> </body> </html>"
		response.end(randomChar)
	}
	else if(path = '/style') {
		var css = fs.readFileSync('./style.css')
		response.end(css)
	}
});

server.listen(2000) 

// <link rel='stylesheet' href='/style'>
// /hello?name=Jeff
  // * `/hello?name=Jeff` - responds with `<h1>Jeff</h1>`
  //   * this should work for any name, ie `/hello?name=Neel` responds with `<h1>Neel</h1>`
