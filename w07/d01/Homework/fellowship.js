var http = require('http');
var fs = require('fs');

var document = fs.readFileSync('./index.html').toString();


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

var lands = [
	"The Shire", 
	"Rivendell", 
	"Mordor"];

lands.forEach(function(land){
		var landList = document.createElement("h1");
		landList.innerText = land;
		var middleEarth = document.createElement("div");
		middleEarth.innerText = landList;
		var divMiddleEarth = document.getElementById("middle-earth");
		divMiddleEarth.appendChild(landList);
});



hobbits.forEach(function(hobbit) {
	var hobbitList = document.createElement("ul")
	hobbitList.innerText = hobbit
	hobbitList.className = "hobbit"
	var hobbitsInTheShire = document.getElementsByTagName("h1")[0]
	hobbitsInTheShire.appendChild(hobbitList);
});



function keepItSecretKeepItSafe() {
	var divTheRing = document.createElement("div")
	divTheRing.id = "the-ring"
	var frodo = document.getElementByTagName("h1")[0].children[0]
	divTheRing.appendChild(frodo);
};

function makeBuddies(buddies) {
	var aside = document.createElement("aside");
	var list = document.createElement("ul");
	list.id = "buddies";
	aside.appendChild(list);

	buddies.forEach(function(buddie){
		var newBuddie = document.createElement("li");
		newBuddie.innerText = buddie;
		newBuddie.className = "buddie"
		list.appendChild(newBuddie);
	});

	var middleEarth = document.getElementById("middle-earth");
	var rivendell = document.getElementById("Rivendell");
	middleEarth.insertBefore(aside, rivendell);
}

function beautifulStranger() {
 	var strider=document.getElementsByClassName("buddie")[3];
 	strider.innerText="Aragorn";
}

