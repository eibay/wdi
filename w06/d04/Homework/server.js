var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
	
	var path = request["url"];
	var splits = path.split("/");
	

	if(path == '/'){
		var html = fs.readFileSync("./views/index.html")
		response.end(html);
	} 

	else if (path == "/styles.css"){
		var css = fs.readFileSync("./styles.css")
		response.end(css);
	} 

	else if (path == '/cast'){
		var html = fs.readFileSync("./views/members.html")
		response.end(html);
	} 

	else if (path == '/cast/random'){
		var html = fs.readFileSync("./views/random.html")
		response.end(html);
	} 

	else if (splits[1].split("?")[0] == "hello") {
		var name = splits[1].split("?")[1].split("=")[1];
		response.end("<h1>Hello " + name + "</h1>");

	} 

	else {
		response.end("<h1>ERROR</h1>")
	};
});

server.listen(2000);








	