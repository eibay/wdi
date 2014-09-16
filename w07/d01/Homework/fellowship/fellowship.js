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

var lands = [
	"The Shire", 
	"Rivendell", 
	"Mordor"
];

function makeMiddleEarth(lands) {
	var middleEarth = document.getElementById("middle-earth");
	lands.forEach(function(land) {
		var newDiv = document.createElement("div");
		newDiv.id = land.split(" ").join("_");
		var h1 = document.createElement("h1");
		h1.innerText = land;
		newDiv.appendChild(h1);
		middleEarth.appendChild(newDiv);

		});
}

// makeMiddleEarth(lands);
   

function makeHobbits(hobbits) {
   // display an unordered list of hobbits in the shire
  // give each hobbit a class of hobbit
  var land = document.getElementById("The_Shire");

  hobbits.forEach(function(hobbit) {
    var ul = document.createElement("ul");
    var li = document.createElement("li");

    li.className = "hobbit";
    li.innerText = hobbit;
    ul.appendChild(li);
    land.appendChild(ul);

  });

}

// makeHobbits(hobbits);

function keepItSecretKeepItSafe() {
	// create a div with an id of 'the-ring'
  // add the ring as a child of Frodo

		var frodo = document.getElementsByClassName('hobbit')[0];
		var theRing = document.createElement("div");
		theRing.id = "the-ring";
		frodo.appendChild(theRing);
}

// keepItSecretKeepItSafe();


function makeBuddies(buddies) {
		var midEarth = document.getElementById("middle-earth");
		var aside = document.createElement("aside");
		var newUl = document.createElement("ul");

		buddies.forEach(function(buddy) {
		var newLi = document.createElement("li");
		newLi.innerText = buddy;
		newUl.appendChild(newLi);
		});
		aside.appendChild(newUl);
		var placement = midEarth.children[1];
		var insertedElement = midEarth.insertBefore(aside, placement);

}

// makeBuddies(buddies);

function beautifulStranger() {
	// change the buddy 'Strider' textnode to "Aragorn"
}

function forgeTheFellowShip() {
	// move the hobbits and the buddies to Rivendell
  // create a new div called 'the-fellowship'
  // add each hobbit and buddy one at a time to 'the-fellowship'
  // after each character is added make an alert that they have joined your party
}