// Modify this server to have two routes, one that serves html with just a body and script tag, and another route that serves a javascript file

var http = require('http');
var url = require('url');
var request = require('request');
var fs = require('fs');

var server = http.createServer(function(request, response) {
	console.log("connection made")


	var path = request['url'];
	console.log("client is attempting to reach" + path + " route");

	  if (request.url == "/") {
	    response.end(fs.readFileSync("exer3.html"));
	  }
		else if (request.url == "/jsss") {
	    response.end(fs.readFileSync("exer3.js"));
		}





});
server.listen(2000);
