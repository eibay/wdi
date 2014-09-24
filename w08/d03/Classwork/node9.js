var http = require('http');
var server = http.createServer(function(request, response){
	var path = request["url"]
	var names = ["Tom", "Dick", "Harry"]
	var msg = String(hashing())
	console.log("Connection from client has been made")

	response.end(msg)
});

server.listen(2000);

function hashing() {
	var color = new Object();
color["Tom"] = "Red"
color["Dick"] = "Blue"
color["Harry"] = "Yellow"
console.log(color)
	return color
}
