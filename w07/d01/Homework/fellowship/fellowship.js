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

var middleEarth = document.getElementById("middle-earth");

function makeMiddleEarth(lands){
	var middleEarth = document.getElementById("middle-earth");
	for (var i = 0; i < lands.length; i++) {
		var element = document.createElement("div");
		element.innerHTML = "<h1>" + lands[i] + "</h1>";
		middleEarth.appendChild(element);
		};
};

function makeHobbits(hobbits) {
	shire = document.getElementById("middle-earth").children[0];
	ul = document.createElement("ul");
	shire.appendChild(ul);
	shire_ul = shire.children[1]
	for (var i = 0; i < hobbits.length; i++) {
		var li = document.createElement("li");
		li.innerText = hobbits[i];
		li.setAttribute("class", "hobbit")
		shire_ul.appendChild(li);
		};
};

function keepItSecretKeepItSafe() {
	var frodo = document.getElementsByClassName("hobbit")[0];
	var div = document.createElement("div");
	div.setAttribute("id", "the-ring");
	frodo.appendChild(div);
};

function makeBuddies(buddies) {
	var aside = document.createElement("aside");
	var ul = document.createElement("ul");
	for (i = 0; i < buddies.length; i++) {
			var li = document.createElement("li");
			li.innerHTML = buddies[i];
			ul.appendChild(li)};
	aside.appendChild(ul);
	var middleEarth = document.getElementById("middle-earth");
	middleEarth.insertBefore(aside, middleEarth.children[1]);
	}

function beautifulStranger() {
	var aside = document.querySelectorAll("aside");
	strider = aside.children[0].children[3];
	strider.innerText = "Aragorn";
}

// function forgeTheFellowShip() {
//   // move the hobbits and the buddies to Rivendell
//   // create a new div called 'the-fellowship'
//   // add each hobbit and buddy one at a time to 'the-fellowship'
//   // after each character is added make an alert that they have joined your party
// }