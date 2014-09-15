var http = require('http')
var fs = require('fs')

var server = http.createServer(function(request, response){
	console.log("Connection");

var path = request["url"];
var character = ["Ross", "Joey", "Chandler", "Monica", "Rachel", "Phoebe"];  

if (path=="/") {
	response.end(fs.readFileSync("./views/index.html"));
}
else if (path=="/cast"){
	var i = 0
	while (i < character.length){
	i+=1;
   	response.end("<h1><li>"+ character+ "</li></h1>");
}
}
else if (path=="/cast/random"){
	var random = Math.floor(Math.random() * character.length);
	var randomcharacter = character[random]
	response.end("<h1>"+randomcharacter+ "</h1>");
}
// /hello?name=Jeff
else if (path.split("?").length > 1) { 
		if (path.split("?")[1].split("=")[0] == 'name') {
		var name = path.split("?")[1].split("=")[1]
		response.end("<h1>"+name+"</h1>");
}
else if (path=="/cast/add"){
	response.end(fs.readFileSync("./views/add.html"));	
}
}
});

server.listen(2000)