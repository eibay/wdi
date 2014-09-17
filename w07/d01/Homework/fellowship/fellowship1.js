// Dramatis Personae

var hobbits = [
  "Frodo Baggins",
  "Samwise 'Sam' Gamgee",
  "Meriadoc 'Merry' Brandybuck",
  "Peregrin 'Pippin' Took"
];

var buddies = [
  "Gandalf the Grey",
  "Legolas",
  "Gimli",
  "Strider",
  "Boromir"
];

var lands = ["The_Shire", "Rivendell", "Mordor"];


function makeMiddleEarth(lands) {  
  var middleEarth = document.getElementById("middle-earth"); 
	for (var i = 0; i < lands.length; i++) {
		var landDiv = document.createElement("div");
		landDiv.innerHTML = "<h1>" + lands[i] + "</h1>";
    landDiv.id = lands[i];
		middleEarth.appendChild(landDiv);
	}
}

function makeHobbits(hobbits) {
  var hobs = document.getElementById("The_Shire");
  var hobbitUl = document.createElement("ul");
  hobs.appendChild(hobbitUl);
  for (var i = 0; i < hobbits.length; i++) {
    var hobbitLi = document.createElement("li");
    hobbitLi.className = "hobbit";
    hobbitLi.innerText = hobbits[i];
    hobbitUl.appendChild(hobbitLi);
  }
}

function keepItSecretKeepItSafe() {
  var mainHob = document.querySelector('li');
  var theRing = document.createElement('div');
  theRing.id = "the-ring";
  mainHob.appendChild(theRing);
}

function makeBuddies(buddies) {
  var side = document.createElement("aside")
  var friendsUl = document.createElement("ul");
  side.appendChild(friendsUl);
  for (var i = 0; i < buddies.length; i++) {
    var friendLi = document.createElement("li");
    friendLi.innerText = buddies[i];
    friendsUl.appendChild(friendLi); 
  }
  var rivendell = document.getElementbyId("Rivendell");
  var middleearth = document.getElementbyId("middle-earth");
  middleearth.insertBefore(side, rivendell);
}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}