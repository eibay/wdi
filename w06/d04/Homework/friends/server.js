var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response) {
	console.log("connection made")

var allFriends = ["Rachel Green", "Monica Geller", "Phoebe Buffay", "Joey Tribbiani", "Chandler Bing", "Ross Geller", "Gunther", "Janice"];

	var path = request['url'];
	console.log("client is attempting to connect from");

	if (path == '/') {
		var html = fs.readFileSync('./index.html');
		response.end(html);
	} else if (path == '/style.css') {
		var css = fs.readFileSync('./style.css');
		response.end(css); 
	} else if (path == '/cast') {
		var allFriends = ["Rachel Green", "Monica Geller", "Phoebe Buffay", "Joey Tribbiani", "Chandler Bing", "Ross Geller", "Gunther", "Janice"];
		var friendList = [];
		for (var i = 0; i < allFriends.length; i++) {
			friendList.push('<li>' + allFriends[i] + '</li>')
		}		
debugger
		response.end("this is cast"); 
	} else if (path == '/cast/random') {
		// var html = "member"
		// response.end(member);
// var randomFriend = allFriends[Math.floor(Math.random() * allFriends.length)]

	// }

		response.end("this is member"); 
	} else {
		response.end("<h2>you have no friends</h2>");
	};











});
server.listen(2000);