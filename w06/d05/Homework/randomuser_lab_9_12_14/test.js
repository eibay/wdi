var http = require('http');
//var fs = require('fs');

var names =["Bumblebee", "Banderscoop", "Broccoli", "Rinkydink", "Bombadil", "Boilerduck", "Bandicoot", "Fragglerock", "Muffinmitts", "Crumplesack", "Congleton", "Blubberbrains", "Buffalo", "Benadryl", "Butterfree", "Burberry", "Whippersnatch", "Buttermilk", "Beezlebub", "Budapest", "Boilerdang", "Blubberwhale", "Bumberstump", "Bulbasaur", "Cogglesnatch", "Liverswort", "Bodybuild", "Johnnycash", "Burgerking", "Bonaparte", "Bunsenburner", "Billiardball", "Baseballmitt", "Blubberbett", "Baseballbat", "Rumblesack", "Barister", "Danglerack", "Rinkydink", "Bombadil", "Honkytonk", "Billyray", "Bumbleshack", "Snorkeldink", "Anglerfish", "Beetlejuice", "Bedlington", "Bandicoot", "Boobytrap", "Bentobox", "Pallettown", "Wimbledon", "Hairyhog", "Buttercup", "Blasphemy", "Syphilis", "Snorkeldink", "Brandenburg", "Barbituate", "Snozzlebert", "Tiddleywomp", "Bouillabaisse", "Wellington", "Benetton", "Bendandsnap", "Timothy", "Brewery", "Bentobox", "Brandybuck"];

var locations =["Acadia National Park", "Arches National Park","Badlands National Park","Big Bend National Park","Biscayne National Park","Black Canyon of the Gunnison National Park","Bryce Canyon National Park","Canyonlands National Park","Capitol Reef National Park","Carlsbad Caverns National Park","Channel Islands National Park","Congaree National Park","Crater Lake National Park","Cuyahoga Valley National Park","Death Valley National Park","Denali National Park & Preserve","Dry Tortugas National Park","Everglades National Park","Gates of the Arctic National Park", "Glacier Bay National Park","Glacier National Park","Grand Canyon National Park","Grand Teton National Park","Great Basin National Park","Great Sand Dunes National Park and Preserve","Great Smoky Mountains National Park","Guadalupe Mountains National Park","Haleakala National Park","Hawaii Volcanoes National Park","Hot Springs National Park","Isle Royale National Park","Joshua Tree National Park","Katmai National Park and Preserve","Kenai Fjords National Park","Kings Canyon National Park","Kobuk Valley National Park","Lake Clark Nat"
];


var users=[
	{name: 'yoyo', age: 25, location: 'NYC', id: 1},
	{name: 'jet', age: 35, location: 'NYC', id: 2}
	];


var server = http.createServer(function(request, response){
	
	var path = request["url"];

	if (path.indexOf('?')>0){
		var page_length = path.split('=')[1][0];
		var page_num = path.split('=')[2];
		
		var users_paginated = [];		

		for (var i = 0; i < page_length; i++){ 
				var user = users[((page_length * page_num)-page_length) + i];
				users_paginated.push(user);
			};

		users_in_json = JSON.stringify(users_paginated);
		response.end(users_in_json);

	}else if (path.split("/")[2] == 'create'){
	
		var name = names[Math.floor(Math.random() * names.length)];
		var location = locations[Math.floor(Math.random() * locations.length)];
		var age = Math.floor(Math.random() * 100);
		var id = users.length + 1;
		var user_hash = {name: name, age: age, locaiton: location, id: id};
		
		users.push(user_hash); //persist data

		var json_user_hash = JSON.stringify(user_hash);
		response.end(json_user_hash);
	
	}else{
		var id = parseInt(path.split('/')[2])
		users.forEach(function(user){
			if(user['id'] == id){
				user_hash = JSON.stringify(user)
				response.end(user_hash);
			};

		});
	};
});

server.listen(2000);
