var http = require('http');
var fs = require('fs');
// var json = require('json')
// var httparty = require('httparty')

var server = http.createServer(function(request, response){

	// debugger
	console.log("Connection from client has been made")

	var path = request["url"];
	var userId = path.split("/")[2];
	var method = request["method"];

	console.log("Client is attempting to reach the " + path + " route");
	// console.log(request);

	// I guess if I was a proper lazy developer instead of making this hash I would 
	// scrape data from random user and parse it with nokogiri
	var boyMusician = [
  	{id: 1, name: "Jimmy Heyes", instrument: "guitar", band: "Juicy", email: "jheyes@gmail.com"},
  	{id: 2, name: "Jane Smith", instrument: "keyboard", band: "Juicy", email: "jsmith@gmail.com"},
  	{id: 3, name: "Jimmy Page", instrument: "guitar", band: "Led Zeppelin", email: "jpage@gmail.com"},
  	{id: 4, name: "Robert Plant", instrument: "vocals", band: "Led Zeppelin", email: "rplant@gmail.com"},
  	{id: 5, name: "John Paul Jones", instrument: "keyboard", band: "Led Zeppelin", email: "jjones@gmail.com"},
  	{id: 6, name: "John Bonham", instrument: "drums", band: "Led Zeppelin", email: "jbonham@gmail.com"},
  	{id: 7, name: "Mick Jagger", instrument: "vocals, harmonica", band: "The Rolling Stones", email: "mjagger@gmail.com"},
  	{id: 8, name: "Keith Richards", instrument: "guitar", band: "The Rolling Stones", email: "krichards@gmail.com"},
  	{id: 9, name: "Billy Wyman", instrument: "bass", band: "The Rolling Stones", email: "bwyman@gmail.com"},
  	{id: 10, name: "Ronnie Wood", instrument: "guitar", band: "The Rolling Stones", email: "rwood@gmail.com"},
  	{id: 11, name: "Charlie Watts", instrument: "drums", band: "The Rolling Stones", email: "cwatts@gmail.com"}
	];
	
	if (path == '/user/create'){
		var x = Math.floor(Math.random() * boyMusician.length);
		var boyMusician_in_json = JSON.stringify(boyMusician[x]);
		response.end(boyMusician_in_json);
	} 

	else if (path == '/user/' + userId){
		for (var i = 0; i < boyMusician.length; i++) {
	  	var id = boyMusician[i]["id"];

			if(id == userId){
				var boyMusician_in_json = JSON.stringify(boyMusician[i]);
				response.end(boyMusician_in_json);
			}
		}
	}

	else if (path == "/styles.css"){
		var css = fs.readFileSync("./styles.css")
		response.end(css);
	} 

	else {
		response.end("<h1>ERROR</h1>");
	};

});

server.listen(2000);


