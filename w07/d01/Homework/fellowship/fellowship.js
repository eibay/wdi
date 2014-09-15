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
	var middleEarth = document.getElementById("middle-earth"); 
	for (var i = 0; i < lands.length; i++) {
		var land = lands[i]; 
		var divId = land.toLowerCase().replace(' ', '-');  

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
}

function keepItSecretKeepItSafe() {
}

function makeBuddies(buddies) {
}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}