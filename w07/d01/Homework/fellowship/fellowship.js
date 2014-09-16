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

    // add each land as another div tag to the middle-earth div
    // inside each div tag for a land, include an h1 with the name of the land
function makeMiddleEarth(lands) {
	var midDiv = document.getElementById("middle-earth");
	for (var i = 0; i < lands.length; i++) {
		var landDiv = document.createElement("div");
		landDiv.innerHTML = "<h1></h1>";
		landDivHead = landDiv.children[0];
		landDivHead.innerText = lands[i];
		midDiv.appendChild(landDiv);
	}
	return midDiv;
}

makeMiddleEarth(lands);

 	// display an unordered list of hobbits in the shire
  	// give each hobbit a class of hobbit
function makeHobbits(hobbits) {
	var midEarth = document.getElementById("middle-earth");	
	var shire = midEarth.children[0];
	var list = document.createElement("ul");
	for (var h = 0; h < hobbits.length; h++) {
		var hobbit = document.createElement("li");
		hobbit.className = "hobbit"
		hobbit.innerText = hobbits[h];
		list.appendChild(hobbit);
	}
	shire.appendChild(list);
	return list;
}

makeHobbits(hobbits);

  // create a div with an id of 'the-ring'
  // add the ring as a child of Frodo
function keepItSecretKeepItSafe() {
	var frodo = document.getElementsByClassName('hobbit')[0];
	var thering = document.createElement("div");
	thering.id = "thering";
	frodo.appendChild(thering);
}

keepItSecretKeepItSafe()

  // create an aside tag
  // display an unordered list of buddies in the aside
  // insert your aside before rivendell
function makeBuddies(buddies) {
	var midDiv = document.getElementById("middle-earth");
	var asideBuds = document.createElement("aside");
	var listBuds = document.createElement("ul");
	for (var b = 0; b < buddies.length; b++) {
		var buddy = document.createElement("li");
		buddy.innerText = buddies[b];
		listBuds.appendChild(buddy);
	}
	asideBuds.appendChild(listBuds);
	var whatBefore = midDiv.children[1];
	var inserted = midDiv.insertBefore(asideBuds, whatBefore);
}
// var insertedElement = parentElement.insertBefore(newElement, referenceElement);
makeBuddies(buddies)

// function beautifulStranger() {
// }

// function forgeTheFellowShip() {
// }