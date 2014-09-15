var http = require('http');
var fs = require('fs');


var server = http.createServer(function(request, response){
debugger
	console.log("Connection from client has been made")
	var index = fs.readFileSync("./index.html")
	var css = fs.readFileSync("./stylesheet.css")
	var path = request["url"] 
	var cast = ["Monica", "Phoebe", "Joey", "Chandler", "Ross", "Rachel"]
	var list = "<html><body><ul>"
if (path == "/"){
	i = 0
	while (i < cast.length){
		list = list + "<li>" + cast[i] + "</li>";
		i ++ 
	};

	list = list + "</ul></body></html>"

// } else if (path == "/style.css"){
// 	response.end(css)
// } else 
// 	response.end("Errorrrrr")
// });

server.listen(2000);


