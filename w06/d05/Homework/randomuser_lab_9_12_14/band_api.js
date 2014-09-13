var http = require('http');

var bands = [ {name: "Wise Moo", genre: "drone", location: "Berlin"}, {name: "Pseudo Dazzle", genre: "disco", location: "San Diego"}, {name: "Blasphemy Wall", genre: "christian rock", location: "Mobile"}, {name: "Scraping Havoc", genre: "hardcore", location: "Helsinki"}, {name: "Nebraska Tuna", genre: "novelty", location: "Omaha"}, {name: "Pile Resistor", genre: "noise", location: "Detroit"}, {name: "The Schadenfreudes", genre: "emo", location: "Bushwick"}, {name: "Elemental Cucumber", genre: "psychodelic", location: "San Francisco"}];

var server = http.createServer(function(request, response){
	console.log("connection made")

var path = request['url'];
console.log("client is attempting to reach " + path + " route");
			// debugger

if (path == '/') {
	bands_in_json = JSON.stringify(bands);
	response.end(bands_in_json);
}
else if (path == '/band/create') {
	var randomBand = bands[Math.floor(Math.random() * bands.length)];
		// debugger
		createdBand = JSON.stringify(randomBand);
		response.end(createdBand);
	// var randomFriend = allFriends[Math.floor(Math.random() * allFriends.length)];
}





});

server.listen(2000);
