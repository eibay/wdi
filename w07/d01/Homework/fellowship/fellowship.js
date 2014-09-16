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
	var middleEarth = document.getElementById('middle-earth');

	lands.forEach(function(land){
		var landDiv = document.createElement('div');
		landDiv.id = land.split('').join('');
		var header = document.createElement('h1');
		header.innerText = land;
		landDiv.appendChild(header);
		middleEarth.appendChild(landDiv);
	});
}

	// add each land as another div tag to the middle-earth div
    // inside each div tag for a land, include an h1 with the name of the land
    // append middle-earth to your document body


function makeHobbits(hobbits) {
	var theShire = document.getElementById('the-shire');
	var list = document.createElement('ul');
	list.id = "hobbits";
	
	hobbits.forEach(function(hobbit){
		var newHobbit = document.createElement('li');
		newHobbit.innerText = hobbit;
		newHobbit.className = 'hobbit';
		list.appendChild(new_hobbit);
	});
		theShire.appendChild(list);
}

	// display an unordered list of hobbits in the shire
  	// give each hobbit a class of hobbit


function keepItSecretKeepItSafe() {
	var frodo = document.getElementsByClassName('hobbit')[0];
	var theRing = document.createElement('div');
	theRing.id = "the-ring";
	frodo.appendChild(theRing);
}	

	// create a div with an id of 'the-ring'
  	// add the ring as a child of Frodo


function makeBuddies(buddies) {
	var asideTag = document.createElement('aside');
	var newUl = document.createElement('ul');
	newUl.id = "buddies";
	asideTag.appendChild(newUl);

	buddies.forEach(function(buddy){
		var newBuddy = document.createElement('li');
		newBuddy.innerText = buddy;
		newBuddy.className = 'buddy';
		newUl.appendChild(newBuddy);
	});

	var middleEarth = document.getElementById('middle-earth');
	var rivendell = document.getElementById('Rivendell');
	middleEarth.insertBefore(aside, rivendell);
}

	// create an aside tag
  	// display an unordered list of buddies in the aside
	// insert your aside before rivendell


function beautifulStranger() {
	var strider = document.getElementsByClassName("buddy")[3];
	strider.innerText = "Aragorn";
}
	// change the buddy 'Strider' textnode to "Aragorn"


function forgeTheFellowShip() {
	// move the hobbits and the buddies to Rivendell
	// create a new div called 'the-fellowship'
	// add each hobbit and buddy one at a time to 'the-fellowship'
	// after each character is added make an alert that they have joined your party
}