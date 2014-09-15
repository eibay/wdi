var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){

	console.log("Connection from client has been made")
		
	var path= request["url"];
	var friends=["Jennifer Aniston", "Courteney Cox", "Lisa Kudrow", "Matt LeBlanc", "Matthew Perry", "David Schwimmer"];

	var cast = function(array){

		var random = array[Math.floor(Math.random() * array.length)];
		
		return random
	}; 


	if (path == '/'){
		var html = fs.readFileSync("./views/index.html")
		response.end(html);
	}else if (path=="/styles.css"){
		var css= fs.readFileSync("./styles.css")
		response.end(css);
	}else if (path =='/cast'){
		
		var list = ""
		
		for(var i = 0; i <=friends.length-1; i++){
			var cast = "<li>" + friends[i] + "</li>"
			list += cast
		};

		response.end("<html><ul>" + list + "</ul></html>");

	}else if (path =='/cast/random'){
		var random = cast(friends)
		response.end("<h1>" + random + "</h1>")
	}else if (path.indexOf("?") > 0){
		var name = path.split("=")[1]
		response.end("<h1>" + name + "</h1>")
	}else{
		response.end("error");
	};

	
	// debugger
	

});

server.listen(2000);