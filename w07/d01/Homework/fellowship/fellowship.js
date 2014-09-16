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

function seed() {
	makeMiddleEarth(lands);
	makeHobbits(hobbits);
	keepItSecretKeepItSafe();
	makeBuddies(buddies);
	beautifulStranger();
}

function makeMiddleEarth(lands) {
	var midearth = document.getElementById("middle-earth");
	for (var i = 0; i < lands.length; i++) {
		var div = document.createElement("div");
		midearth.appendChild(div);
		midearth.children[i].id = lands[i].split(" ").join("").toLowerCase();
		var header = document.createElement("h1");
		midearth.children[i].appendChild(header);
		midearth.children[i].children[0].innerText = lands[i];
	}
}

function makeHobbits(hobbits) {
	var shire = document.getElementById("theshire");
	var hobbitList = document.createElement("ul");
	shire.appendChild(hobbitList);
	for (var i = 0; i < hobbits.length; i++) {
	listItem = document.createElement("li");
	shire.children[1].appendChild(listItem);
	shire.children[1].children[i].className = "hobbit";
	shire.children[1].children[i].innerText = hobbits[i];
	}
}

function keepItSecretKeepItSafe() {
	var ring = document.createElement("div");
	ring.id = "the-ring";
	var hobbits = document.getElementsByClassName("hobbit");
	var frodo = hobbits[0];
	frodo.appendChild(ring);
}

function makeBuddies(buddies) {
	var aside = document.createElement("aside");
	aside.id = "buddies";
	var list = document.createElement("ul")
	aside.appendChild(list)
	buddies.forEach(function(buddy) {
		listItem = document.createElement("li");
		listItem.id = buddy.split(" ").join("").toLowerCase();
		listItem.innerText = buddy;
		list.appendChild(listItem);
	})
	var midearth = document.getElementById("middle-earth");
	var rivendell = document.getElementById("rivendell");
	midearth.insertBefore(aside, rivendell);
}

function beautifulStranger() {
	var strider = document.getElementById("strider");
	strider.innerText = "Aragorn";
}

function forgeTheFellowShip() {
	var shire = document.getElementById("theshire");
	var rivendell = document.getElementById("rivendell");
	var hobbits_parent = shire.children[1];
	var buddies = document.getElementById("buddies");
	rivendell.appendChild(hobbits_parent);
	rivendell.appendChild(buddies);
	var fellowship = document.createElement("div");
	fellowship.id = "fellowship";
	fellows = document.createElement("ul");
	fellowship.appendChild(fellows);
	rivendell.appendChild(fellowship);
	hobbits = document.getElementsByClassName("hobbit");
	for (var i = 0; i < hobbits.length; i++) {
		var newHobbit = document.createElement("li");
		newHobbit.innerText = hobbits[i].innerText;
		fellows.appendChild(newHobbit);
		window.alert("Hobbit added to Fellowship");
	};
	rivendell.removeChild(hobbits_parent);
	var buddies = document.getElementById("buddies");
	for (var i = 0; i < buddies.children[0].children.length; i++) {
		var newBuddy = document.createElement("li");
		newBuddy.innerText = buddies.children[0].children[i].innerText;
		fellows.appendChild(newBuddy);
		window.alert("Buddy added to Fellowship");
	};
	rivendell.removeChild(buddies);
}