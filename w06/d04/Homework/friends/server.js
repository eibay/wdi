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
		var html = fs.readFileSync('./cast.html', 'utf8');
		var allFriends = ["Rachel Green", "Monica Geller", "Phoebe Buffay", "Joey Tribbiani", "Chandler Bing", "Ross Geller", "Gunther", "Janice"];
		var friendList = [];
		for (var i = 0; i < allFriends.length; i++) {
			friendList.push('<li>' + allFriends[i] + '</li>')
		}	
		var friendListJoined = friendList.join("");
// ben did the next 2 lines
		var splitHtml = html.split('#');
		var finalHtml = splitHtml[0] + friendListJoined + splitHtml[1];
		response.end(finalHtml); 
	} else if (path == '/cast/random') {
		var html = fs.readFileSync('./member.html', 'utf8');
// I tried to copy what Ben did but it doesn't see the css and i'm out of time
		var allFriends = ["Rachel Green", "Monica Geller", "Phoebe Buffay", "Joey Tribbiani", "Chandler Bing", "Ross Geller", "Gunther", "Janice"];

		var randomFriend = allFriends[Math.floor(Math.random() * allFriends.length)];
		var splitHtml = html.split('#');
		var finalHtml = splitHtml[0] + randomFriend + splitHtml[1];
		response.end(finalHtml); 
	} else {
		response.end("<h2>you have no friends</h2>");
	};











});
server.listen(2000);