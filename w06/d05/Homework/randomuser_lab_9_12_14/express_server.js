var express = require('express');
var app = express()

var redis = require('redis');
var client = redis.createClient();

//var characters = [];
var firstnames = ["Axl", "Josh", "Tim", "Akita", "Dominick", "Richard", "Tom", "Ben", "Kurt", "Dave"];
var lastnames = ["Rose", "Homme", "Hecker", "Masami", "Fernow", "James", "Jenkinson", "Vrellen", "Cobain", "Grohl"];
var instruments = ["vocals", "guitar", "bass", "drums", "violin", "electronics","laptop", "saxophone", "viola", "cello"]
//client.set("characters", JSON.stringify(characters));

//server
app.get("/", function(req, res) {
	var characters = client.get("characters", function (error, characters) {
	res.send(characters);
	})
})
	
app.get("/users/create", function(req, res) {
	client.get("characters", function (error, characters) {
		var chars_parse = JSON.parse(characters);
		var character = {name: firstnames[Math.floor(Math.random() * firstnames.length)] + " " + lastnames[Math.floor(Math.random() * firstnames.length)], instrument: instruments[Math.floor(Math.random() * instruments.length)], id: chars_parse.length + 1};
		chars_parse.push(character);
		client.del("characters");
		client.set("characters", JSON.stringify(chars_parse),redis.print);
		//client.save();
		res.send(JSON.stringify(chars_parse));
	})
})

app.get("/user/:user_id", function(req, res) {
	client.get("characters", function (error, characters) {		
		var chars_parse = JSON.parse(characters);
		chars_parse.forEach(function(char) {
			if(char["id"] == req.params["user_id"]) {
				res.send("<h1>" + char["name"] + "</h1><h3>" + char["instrument"] + "</h3>");
			}
		})
	})
})

app.get("/users", function(req, res) {
	var page_length = parseInt(req.query.page_length);
	var page_num = parseInt(req.query.page_num);
	client.get("characters", function (error, characters) {		
		var chars_parse = JSON.parse(characters);
		if (page_num == 1) {
			var start_index = 0;
			var end_index = page_length - 1;
		} else {
			start_index = page_length * page_num;
			end_index = start_index + page_length;
		}
		var requested_characters = [];
		for (var i = start_index; i < end_index; i++) {
			requested_characters.push(chars_parse[i]);
		}
		if(requested_characters.indexOf('null')) {
			res.send("ERROR: no results in that page range");
		} else {
			res.send(JSON.stringify(requested_characters));
		}
	})
})

var server = app.listen(3000, function() {
    console.log('Listening on port %d', server.address().port);
})