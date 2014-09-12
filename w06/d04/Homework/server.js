var http = require('http');
var fs = require('fs');


var server = http.createServer(function (req, res){
	console.log("Connection from client has been made")

	var path = req["url"]
	// html files
	var index = fs.readFileSync("./index.html")
	var css = fs.readFileSync("./stylesheet.css")
	var cast = fs.readFileSync("./cast.html").toString() 
	var random_cast = fs.readFileSync("./cast_random.html").toString()

	// server
	if (path == "/"){
			res.end(index)
	
	} else if (path == "/stylesheet.css"){
			res.end(css)
	

	} else if (path =="/cast"){
			var cast_members = ["Joey", "Chandler", "Monica", "Ross", "Rachel", "Pheobe"]
			
			function html_cast(tag, character_array){
				var array = []
				x = 0 
				while (x < character_array.length){
					var character = "<" + tag + ">" + character_array[x] + "</" + tag + ">"
					array.push(character)
					x++	
				}	
				return array 
			}
		var dog = html_cast("li", cast_members)
		
		res.end(cast.replace("{{array}}", dog ))
	} else if (path == "/cast/random"){
		function random_friend(){
			var cast_members = ["Joey", "Chandler", "Monica", "Ross", "Rachel", "Pheobe"]
			var random = cast_members[Math.floor(Math.random()*cast_members.length)];
		return random
		}
		var random = random_friend()
		res.end(random_cast.replace("{{cast}}", random))
	}	else if (path.split("?")[0] == "/hello" && path.split("?")[1].split("=")[0] == "name"){
			var some_name = path.split("?")[1].split("=")[1]
			var name_tags = ("<h1>" + some_name + "</h1>").toString()
			res.end(name_tags)
	}	else {
			res.end("Error")
	};
})

server.listen(2000);
console.log("Server is running at 127.0.0.1.2000/")