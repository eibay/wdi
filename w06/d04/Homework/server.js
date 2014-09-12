var http = require ('http');
var fs = require('fs');
var html = fs.readFileSync('./views/index.html');
var styles = fs.readFileSync('./styles/styles.css')
var server = http.createServer(function(req, res){
var path = req["url"]
var friends = ["Jennifer Aniston", "Courtney Cox", "Lisa Kudrow", "Matthew Perry", "Matt LeBlanc", "David Schwimmer"]
 function friendlist(array) {
	list = "<!DOCTYPE html><html><body><ul>"
	for (var i=0; i < array.length; i++){
			list += ("<li>" + array[i] + "</li>")
	} 
	return list
};
debugger
var randomFriend = friends[Math.floor(Math.random() * friends.length)]



	console.log("connection from client for" + path + " has been made")
	if (path == "/") {
		res.end(html)
	} 
	else if (
		path == "/cast/random") {
		res.end("<h1>" + randomFriend + "</h1>")
	} else if (
		path == "/cast") {
		res.end(friendlist(friends))
		// + "</ul></body></html>")
	} else if (
		path.split("?")[0]=="/hello") {
		var splitpath = path.split("?")[1]
		res.end("<h1>" + splitpath.split("=")[1] + "</h1>")
	} else if (
		path == "/styles.css") {
		res.end(styles)
	}
});

server.listen(2000);