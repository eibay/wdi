var http = require('http');

var createdBands = [];
// this is not the way i would have built the array of possible data if i had realized that i was *building* a random user instead of *plucking* a random user. chose to keep it this way as a time saver once i realized.
var bands = [ {band_id: 1, name: "Unlucky Boxers", genre: "fado", location: "The Azores"}, {band_id: 2, name: "State of Mechanical Warriors", genre: "metal", location: "Cleveland"}, {band_id: 3, name: "Wise Moo", genre: "drone", location: "Berlin"}, {band_id: 4, name: "Pseudo Dazzle", genre: "disco", location: "San Diego"}, {band_id: 5, name: "Blasphemy Wall", genre: "christian rock", location: "Mobile"}, {band_id: 6, name: "Scraping Havoc", genre: "hardcore", location: "Helsinki"}, {band_id: 7, name: "Nebraska Tuna", genre: "novelty", location: "Omaha"}, {band_id: 8, name: "Pile Resistor", genre: "noise", location: "Detroit"}, {band_id: 9, name: "The Schadenfreudes", genre: "emo", location: "Bushwick"}, {band_id: 10, name: "Elemental Cucumber", genre: "psychodelic", location: "San Francisco"}, {band_id: 11, name: "The Sunday Ham Divisor", genre: "alt", location: "Buffalo"}, {band_id: 12, name: "Kentucky P T Rattlesnake", genre: "country", location: "Louisville"}, {band_id: 13, name: "The Velvet Davis Jr.s", genre: "lounge", location: "New York City"}, {band_id: 14, name: "Offshore Pineapple", genre: "surf", location: "Chico"}, {band_id: 15, name: "Tainted Saw", genre: "metal", location: "Indianapolis"}, {band_id: 16, name: "Luv To Emerald Honeybees", genre: "girl group", location: "Los Angeles"}, {band_id: 17, name: "The Lordz Gumdrops", genre: "psychedelic", location: "Bogota"}];

var server = http.createServer(function(request, response){
	console.log("connection made");

	var path = request['url'];
	console.log("client is attempting to reach " + path + " route");

	// var path = 

	// returns all the created bands
// **** just put or in path test
	if ((path == '/') || (path == '/bands')) {
		bands_in_json = JSON.stringify(createdBands);
		response.end(bands_in_json);
		console.log('responded with all bands in JSON');
	}

// **** let's try to paginate instead, ala clayton
// **** query params to get page length and which page
// GET /users?page_length=5&page_num=3



	// for band/create or band/band_id
	else if (path.split('/')[1] == 'band') {

		if (path == '/band/create') {
			console.log("I'm creating a random band!");
			var randomBand = 
				{name: bands[Math.floor(Math.random() * bands.length)]["name"],
				genre: bands[Math.floor(Math.random() * bands.length)]["genre"],
				location: bands[Math.floor(Math.random() * bands.length)]["location"],
				// would be better to increment band_id for uniqueness
				band_id: Math.floor(Math.random() * (1000 - 1)) + 1 
				};
			createdBands.push(randomBand); 
			createdBand = JSON.stringify(randomBand);
			response.end(createdBand);
			console.log('sent the random band on its merry way!');
		}
		else {
			for (var i = 0; i < createdBands.length; i++) {
				if (path == "/band/" + createdBands[i]["band_id"]) {
	 				band = JSON.stringify(createdBands[i]);
	 				response.end(band)
	 				console.log('responded with individual band in JSON');
	 			}
	 		} 	
	 	}
	}
// **** just put or in path test
	else {console.log("error")}


});

server.listen(2000);
