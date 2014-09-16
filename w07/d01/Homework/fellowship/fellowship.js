// Dramatis Personae

var hobbits = [
  "Frodo Baggins",
  "Samwise 'Sam' Gamgee",
  "Meriadoc \"Merry\" Brandybuck",
  "Peregrin 'Pippin' Took"
];

var buddies = [
  "Gandalf the Grey",
  "Legolas",
  "Gimli",
  "Strider",
  "Boromir"
];

var lands = ["The Shire", "Rivendell", "Mordor"];

// display an unordered list of hobbits in the shire
// give each hobbit a class of hobbit
function makeMiddleEarth(lands) {
	var middle_earth = document.getElementById("middle_earth");

	lands.forEach(function(land){
		var earth_lands = document.createElement("div");
		var header = document.createElement("h1");
		header.innerText = land;
		earth_lands.appendChild(header);
		middle_earth.appendChild(earth_lands);
	});
}

// display an unordered list of hobbits in the shire
// give each hobbit a class of hobbit
function makeHobbits(hobbits) {
	var in_the_shire = document.getElementById("The_Shire");
	var list = document.createElement("ul");
	
	hobbits.forEach(function(hobbit){
		var new_hobbit = document.createElement("li");
		new_hobbit.innerText = hobbit;
		new_hobbit.className = "hobbit";
		list.appendChild(new_hobbit);
		in_the_shire.appendChild(list);
	});
}
// create a div with an id of 'the-ring'
// add the ring as a child of Frodo
function keepItSecretKeepItSafe() {
	var child_of_frodo = document.getElementsByClassName("hobbit")[0];
	var the_ring = document.createElement("div");
	the_ring.id = "the_ring"; 
	child_of_frodo.appendChild(the_ring);
}

// create an aside tag
// display an unordered list of buddies in the aside
// insert your aside before rivendell
function makeBuddies(buddies) {
	var aside_tag = document.createElement("aside");
	var list = document.createElement("ul");
	list.id = "buddies";
	aside.appendChild(list);
	
	buddies.forEach(function(buddy) {
		var new_buddy = document.createElement("li");
		new_buddy.innerText = buddy;
		new_buddy.className = "buddy";
		new_list.appendChild(new_buddy);
	});
	var middle_earth = document.getElementById("middle_earth");
	var rivendell = document.getElementById("Rivendell");
	
	middle_earth.insertBefore(Aside, Rivendell); 
}

// change the buddy 'Strider' textnode to "Aragorn"
function beautifulStranger(beautifulStranger) {
	var strider_to_aragorn = document.getElementsByClassName("buddy")[3];
	strider_to_aragorn.innerText= "Aragorn";
}

// move the hobbits and the buddies to Rivendell
// create a new div called 'the-fellowship'
// add each hobbit and buddy one at a time to 'the-fellowship'
// after each character is added make an alert that they have joined your party
function forgeTheFellowShip(forgeTheFellowShip) {
	var rivendell = document.getElementById("Rivendell");

	var the_fellowship = document.createElement("div");
	fellowship = document.createElement("h1");
	fellowship.innerText = "The Fellowship";
	
	the_fellowship.appendChild(fellowship);
	fellowship_list = document.createElement("ul");
	the_fellowship.appendChild(fellowship_list);

	var moved_hobbits = hobbits.cloneNode(true);
	var moved_buddies = buddies.cloneNode(true);
	hobbits.parentNode.removeChild(hobbits);
	buddies.parentNode.removeChild(buddies);

	rivendell.appendChild(moved_hobbits);
	rivendell.appendChild(moved_buddies);
	
	hobbits.forEach(function(hobbit) {
		new_hobbit = document.createElement("li");
		new_hobbit.innerText = hobbit;
		fellowship_list.appendChild(new_hobbit);
		window.alert(+hobbit+" joined the fellowship");
	});
}