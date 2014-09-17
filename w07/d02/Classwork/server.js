var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
	console.log("connection made");

	var path = request['url'];
	console.log("client is attempting to reach " + path + " route");









});

server.listen(2000);
