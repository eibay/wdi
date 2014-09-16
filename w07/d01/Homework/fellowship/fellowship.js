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
	for (var i=0; i < lands.length; i++) {
		var midEarth = document.getElementById("middle-earth")
		var newDiv = document.createElement("div")
		var newH1 = document.createElement("h1")
		midEarth.appendChild(newDiv);
		newDiv.appendChild(newH1);
		newH1.innerText = lands[i]
	}
}

function makeHobbits(hobbits) {
	var shire = document.getElementById("middle-earth").children[0]
	var ul = document.createElement("ul")
	shire.appendChild(ul)
	for (var i=0; i < hobbits.length; i++) {
		var li = document.createElement("li")
		li.className = "hobbit";
		ul.appendChild(li)
		li.innerText = hobbits[i]
	}
}

function keepItSecretKeepItSafe() {
	var frodo = document.getElementsByClassName("hobbit")[0]
	var div = document.createElement("div")
	div.id = "the-ring"
	frodo.appendChild(div)

}

function makeBuddies(buddies) {
	var rivendell = document.getElementById("middle-earth").children[1]
	var aside = document.createElement("aside")
	var midEarth = document.getElementById("middle-earth")
	midEarth.insertBefore(aside, rivendell)
	var ul = document.createElement("ul")
	aside.appendChild(ul)
	for (var i=0; i < buddies.length; i++) {
		var li = document.createElement("li")
		ul.appendChild(li)
		li.innerText = buddies[i]
	}
}

function beautifulStranger() {
	var strider = document.getElementsByTagName('aside')[0].children[0].children[3]
	strider.innerText = "Aragorn"
}

function forgeTheFellowShip() {
	var xhobbits = document.getElementsByClassName('hobbit')
		for (var i = 0; i < xhobbits.length; i++){
	
	
	var rivendell = document.getElementById("middle-earth").children[2]
	var ul = document.createElement("ul")
	rivendell.appendChild(ul)
	var xul = document.getElementById("middle-earth").children[2].children[1]

	xul.appendChild(xhobbits[i])
}
	var buddies = document.getElementsByTagName('aside')[0].children[0]
	for (var i = 0; i < buddies.length; i++){
	var rivendell = document.getElementById("middle-earth").children[2]
	var ul = document.createElement("ul")
	rivendell.appendChild(ul)
	var xul = document.getElementById("middle-earth").children[2].children[1]
	xul.appendChild(buddies)
}
	// hobbits.parentNode.removeChild(hobbits)

	// var div = document.createElement("div")
	// div.id = "the-fellowship"
}