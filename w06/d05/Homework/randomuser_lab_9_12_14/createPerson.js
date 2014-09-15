var users = [];

var names =["Bumblebee", "Banderscoop", "Broccoli", "Rinkydink", "Bombadil", "Boilerduck", "Bandicoot", "Fragglerock", "Muffinmitts", "Crumplesack", "Congleton", "Blubberbrains", "Buffalo", "Benadryl", "Butterfree", "Burberry", "Whippersnatch", "Buttermilk", "Beezlebub", "Budapest", "Boilerdang", "Blubberwhale", "Bumberstump", "Bulbasaur", "Cogglesnatch", "Liverswort", "Bodybuild", "Johnnycash", "Burgerking", "Bonaparte", "Bunsenburner", "Billiardball", "Baseballmitt", "Blubberbett", "Baseballbat", "Rumblesack", "Barister", "Danglerack", "Rinkydink", "Bombadil", "Honkytonk", "Billyray", "Bumbleshack", "Snorkeldink", "Anglerfish", "Beetlejuice", "Bedlington", "Bandicoot", "Boobytrap", "Bentobox", "Pallettown", "Wimbledon", "Hairyhog", "Buttercup", "Blasphemy", "Syphilis", "Snorkeldink", "Brandenburg", "Barbituate", "Snozzlebert", "Tiddleywomp", "Bouillabaisse", "Wellington", "Benetton", "Bendandsnap", "Timothy", "Brewery", "Bentobox", "Brandybuck"];
var locations =["Acadia National Park", "Arches National Park","Badlands National Park","Big Bend National Park","Biscayne National Park","Black Canyon of the Gunnison National Park","Bryce Canyon National Park","Canyonlands National Park","Capitol Reef National Park","Carlsbad Caverns National Park","Channel Islands National Park","Congaree National Park","Crater Lake National Park","Cuyahoga Valley National Park","Death Valley National Park","Denali National Park & Preserve","Dry Tortugas National Park","Everglades National Park","Gates of the Arctic National Park", "Glacier Bay National Park","Glacier National Park","Grand Canyon National Park","Grand Teton National Park","Great Basin National Park","Great Sand Dunes National Park and Preserve","Great Smoky Mountains National Park","Guadalupe Mountains National Park","Haleakala National Park","Hawaii Volcanoes National Park","Hot Springs National Park","Isle Royale National Park","Joshua Tree National Park","Katmai National Park and Preserve","Kenai Fjords National Park","Kings Canyon National Park","Kobuk Valley National Park","Lake Clark Nat"];


function createPerson(){

	var name = names[Math.floor(Math.random() * names.length)];
	var location = locations[Math.floor(Math.random() * locations.length)];
	var new_person = {name: name, location: location};
	var age = Math.floor(Math.random() * 100);
	var id = users.length + 1;
	var user_hash = {name: name, age: age, location: location, id: id};
	

	users.push(user_hash)
	return user_hash


};

person = createPerson()

console.log(person)
console.log(people)