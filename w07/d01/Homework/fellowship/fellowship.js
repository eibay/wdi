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

function makeMiddleEarth(lands) {
	var middle_earth = document.getElementById("middle-earth");

	lands.forEach(function(land) {
		var new_div = document.createElement("div");
		new_div.id = land.split(" ").join("-");
		var h1 = document.createElement("h1");
		h1.innerText = land;

		new_div.appendChild(h1);
		middle_earth.appendChild(new_div);
	});

}

function makeHobbits(hobbits) { 
	var land = document.getElementById("The-Shire");
	var new_ul = document.createElement("ul");

	hobbits.forEach(function(hobbit) {	
		var new_li = document.createElement("li");
		new_li.className = "hobbit";

		new_li.innerText = hobbit;
		new_ul.appendChild(new_li);
		land.appendChild(new_ul);
	});

}

function keepItSecretKeepItSafe() {
	var hobbits = document.getElementsByClassName("hobbit");
	var new_div = document.createElement("div");
	new_div.id = "one-ring";

	hobbits[0].appendChild(new_div);
}

function makeBuddies(buddies) {
	var middle_earth = document.getElementById("middle-earth");
	var rivendell = document.getElementById("Rivendell");
	var aside = document.createElement("aside");
	var new_ul = document.createElement("ul");
	new_ul.id = "buddies"

	buddies.forEach(function(buddy) {
		var new_li = document.createElement("li");
		new_li.id = buddy.split(" ").join("-");

		new_li.innerText = buddy;
		new_ul.appendChild(new_li);
		aside.appendChild(new_ul);
		middle_earth.insertBefore(new_ul, rivendell);

	})
	
}

function beautifulStranger() { 
	var name_changer = document.getElementById("Strider");
	name_changer.innerText = "Aragorn";
}

function forgeTheFellowShip() {
	var rivendell = document.getElementById("Rivendell");
	var fellowship = document.createElement("div");


	// hobbits.forEach(function(hobbit) {
	// 	var h3 = document.createElement("h3");
	// 	h3.innerText = hobbit;
	// 	fellowship.appendChild(h3);
	// 	rivendell.appendChild(fellowship);

		var hobbits = document.querySelectorAll("li.hobbit")
		for (var h=0; i < hobbits.length; h++) {
			fellowship.appendChild(hobbits[i]);

			var h5 = document.createElement("h5");
			var message = hobbits[i].innerText + " has joined the party.";
			h5.innerText = message;

			fellowship.appendChild(h5);
			rivendell.appendChild(fellowship);
		}

		var buddies = document.getElementById("buddies").children
		for (var b=0; i < buddies.length; b++) {
			fellowship.appendChild(buddies[i]);
			
			var message = buddies[i].innerText + " has joined the party.";
			var h5 = document.createElement("h5");
			h5.innerText = message;	

			fellowship.appendChild(h5);
			rivendell.appendChild(fellowship);
		}
}


