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

var middleEarth = document.getElementById("middle-earth");

var lands = ["The Shire", "Rivendell", "Mordor"];

function makeMiddleEarth(lands) {
	lands.forEach(function(land) {
		
		var landName = document.createElement("h1")
		landName.innerText = land

		var land = document.createElement("div");
		land.appendChild(landName)

		middleEarth.appendChild(land)
	})
};
makeMiddleEarth(lands);




function makeHobbits(hobbits) {
	var theShire = middleEarth.children[0]
	var hobbit_ul = document.createElement("ul");

	hobbits.forEach(function(name) {
		var hobbit_li = document.createElement("li")
		hobbit_li.innerText = name

		hobbit_ul.appendChild(hobbit_li);

	})
	theShire.appendChild(hobbit_ul)
}
makeHobbits(hobbits)


function keepItSecretKeepItSafe() {
	var frodo = middleEarth.children[0].children[1].children[0]
	var theRing = document.createElement('div')
	theRing.id = 'the-ring'
	theRing.innerText = "The One Ring"

	frodo.appendChild(theRing)

	// create a div with an id of 'the-ring'
    // add the ring as a child of Frodo
}
keepItSecretKeepItSafe()

function makeBuddies(buddies) {
	var aside = document.createElement('aside')
	var ul = document.createElement('ul')

	buddies.forEach(function(buddy) {
		var li = document.createElement('li')
		li.innerText = buddy
		ul.appendChild(li)
	})
	aside.appendChild(ul)

	middleEarth.insertBefore(aside, middleEarth.children[1])
	// create an aside tag
  	// display an unordered list of buddies in the aside
  	// insert your aside before rivendell
}
makeBuddies(buddies)

function beautifulStranger() {
	var strider = middleEarth.children[1].children[0].children[3]
	strider.innerText = "Aragorn"
	// change the buddy 'Strider' textnode to "Aragorn"
}
beautifulStranger()

function forgeTheFellowShip() {
	var travellers = middleEarth.children[0].children[1]
	travellers.parentNode.removeChild(travellers)
	middleEarth.children[1].appendChild(travellers)

	var fellowship = document.createElement('div')
	fellowship.id = 'the-fellowship'
	var fellowship_ul = document.createElement('ul')

	for(i=0; i<4; i++) {
		var fellowship_li_h = document.createElement('li')
		fellowship_li_h.innerText = hobbits[i]
		fellowship_ul.appendChild(fellowship_li_h)
		alert(hobbits[i] + " has joined the Fellowship!")

		var fellowship_li_b = document.createElement('li')
		fellowship_li_b.innerText = buddies[i]
		fellowship_ul.appendChild(fellowship_li_b)
		alert(buddies[i] + " has joined the Fellowship!")
	}
	var fellowship_li_b = document.createElement('li')
	fellowship_li_b.innerText = buddies[4]
	fellowship_ul.appendChild(fellowship_li_b)
	alert(buddies[4] + " has joined the Fellowship!")

	var goneHobbits = middleEarth.children[0].children[1]
	var goneBuddies = middleEarth.children[1].children[0]
	goneBuddies.parentNode.removeChild(goneBuddies)
	goneHobbits.parentNode.removeChild(goneHobbits)


	fellowship.appendChild(fellowship_ul)

	middleEarth.children[2].appendChild(fellowship)

	// move the hobbits and the buddies to Rivendell
  	// create a new div called 'the-fellowship'
  	// add each hobbit and buddy one at a time to 'the-fellowship'
  	// after each character is added make an alert that they have joined your party
}

forgeTheFellowShip()