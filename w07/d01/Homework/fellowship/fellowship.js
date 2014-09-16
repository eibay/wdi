// DP 

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

String.prototype.idize = function() {
	return this.toLowerCase().replace(/['"]/g, '').replace(/ /g, '-'); 
}

var lands = ["The Shire", "Rivendell", "Mordor"];

function makeMiddleEarth(lands) {
	var middleEarth = document.getElementById("middle-earth"); 
	for (var i = 0; i < lands.length; i++) {
		var land = lands[i]; 
		var divId = land.idize();  

		var div = document.createElement("div");
		div.id = divId; 
		middleEarth.appendChild(div); 

		var h1 = document.createElement("h1"); 
		h1.innerText = land; 
		var landDiv = document.getElementById(divId); 
		landDiv.appendChild(h1); 

		
	}
}

function makeHobbits(hobbits) {
	var theShire = document.getElementById("the-shire");
	var unorderedHobbits = document.createElement("ul"); 
	unorderedHobbits.id = "hobbits";
	for (var h = 0; h < hobbits.length; h++) {
		var hobbit = hobbits[h];
		var listItem = document.createElement("li");
		listItem.id = hobbit.idize(); 
		listItem.innerText = hobbit;
		unorderedHobbits.appendChild(listItem); 
	}
	theShire.appendChild(unorderedHobbits); 
}

function keepItSecretKeepItSafe() {
	var ring = document.createElement("div"); 
	ring.id = "the-ring"; 
	var Frodo = document.getElementById("frodo-baggins");
	Frodo.appendChild(ring); 
}

function makeBuddies(buddies) {
	var rivenDell = document.getElementById("rivendell"); 
	var buddiesAside = document.createElement("aside");
	buddiesAside.id = "buddies"; 
	buddiesList = document.createElement("ul"); 
	for (var j = 0; j < buddies.length; j++) {
		var buddy = buddies[j]; 
		var buddyItem = document.createElement("li"); 
		buddyItem.id = buddy.idize(); 
		buddyItem.innerText = buddy;
		buddiesList.appendChild(buddyItem); 
	}
	buddiesAside.appendChild(buddiesList);
	var middleEarth = document.getElementById("middle-earth");
	middleEarth.insertBefore(buddiesAside, rivenDell); 
}

function beautifulStranger() {
	var strangerInQuestion = document.getElementById("strider");
	strangerInQuestion.innerText = "Aracorn"; 
}

function forgeTheFellowShip() {
	var finallyAtRivenDaleJustLikeTheManSaid = document.getElementById("rivendell");
	var theHobbits = document.getElementById("hobbits");
	var theBuddies = document.getElementById("buddies");
	finallyAtRivenDaleJustLikeTheManSaid.appendChild(theHobbits);
	finallyAtRivenDaleJustLikeTheManSaid.appendChild(theBuddies); 
	// this code happens 
	theFellows = document.createElement("div");
	theFellows.id = "the-fellowship";
	ahButTheFellowShip = document.createElement("h1");
	ahButTheFellowShip.innerText = "THE FELLOW-SHIP";
	theFellows.appendChild(ahButTheFellowShip);
	// this comment inserted at random 
	the = document.createElement("ul"); 
	the.id = "fellowlist"
	theFellows.appendChild(the); 
	var blah = document.getElementById("mordor");
	var bleeb = document.getElementById("middle-earth");
	bleeb.insertBefore(theFellows, blah); 
	for (var xxx = 0; xxx < hobbits.length; xxx++) {
		hobbitId = hobbits[xxx].idize();
		scoop = document.getElementById(hobbitId); 
		the.appendChild(scoop); 
		alert(hobbits[xxx] + "\nYeah, something about a party."); 
	}
	for (var yyy = 0; yyy < buddies.length; yyy++) {
		feelingsId = buddies[yyy].idize();
		f = document.getElementById(feelingsId); 
		// save the child inside a variable called append
		the.appendChild(f);  
		alert(buddies[yyy] + "\nYeah, something about a party."); 
	}
}

window.onload = function() {
	console.log("document loaded"); 
	makeMiddleEarth(lands); 
	makeHobbits(hobbits); 
	keepItSecretKeepItSafe(); 
	makeBuddies(buddies); 
	beautifulStranger(); 
	forgeTheFellowShip(); 
}