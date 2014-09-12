var redis = require('redis');
var http = require("http");

var client = redis.createClient();

var server = http.createServer(function(request, response){

var path = request["url"];

// var characters = [
// 	{id: 1, name: "Axl Rose", band: "Guns 'n' Roses", instrument: "vocals"},
// 	{id: 2, name: "Josh Homme", band: "Queens of the Stone Age", instrument: "vocals, guitar"},
// 	{id: 3, name: "Tim Hecker", band: "none", instrument: "guitar, electronics"},
// 	{id: 4, name: "Akita Masami", band: "Merzbow", instrument: "electronics"},
// 	{id: 5, name: "Dominick Fernow", band: "Prurient", instrument: "electronics"},
// 	{id: 6, name: "Richard James", band: "Aphex Twin", instrument: "electronics"},
// 	{id: 7, name: "Tom Jenkinson", band: "Squarepusher", instrument: "bass, electronics"},
// 	{id: 8, name: "Ben Vrellen", band: "Helms Alee", instrument: "guitar, vocals"},
// 	{id: 9, name: "Kurt Cobain", band: "Nirvana", instrument: "vocals, guitar"},
// 	{id: 10, name: "Dave Grohl", band: "Foo Fighters", instrument: "vocals, guitars, drums"}
// ];
	// client.set("characters", JSON.stringify(characters), redis.print)

var characters = [];
var firstnames = ["Axl", "Josh", "Tim", "Akita", "Dominick", "Richard", "Tom", "Ben", "Kurt", "Dave"];
var lastnames = ["Rose", "Homme", "Hecker", "Masami", "Fernow", "James", "Jenkinson", "Vrellen", "Cobain", "Grohl"];
client.set("characters", JSON.stringify(characters));

if(path == "/") {
	// var characters = client.get("characters", function (error, characters) {
	// response.end(characters);
	// });
} else if (path == "/users/create") {
	client.get("characters", function (error, characters) {
		character = {name: firstnames[Math.floor(Math.random() * firstnames.length)] + " " + lastnames[Math.floor(Math.random() * firstnames.length)], id: characters.length + 1};
		var char_parse = JSON.parse(characters);
		char_parse.push(character);
		client.del("characters");
		client.set("characters", JSON.stringify(char_parse),redis.print);
		response.end(JSON.stringify(char_parse))
	})
}
});
server.listen(2000)