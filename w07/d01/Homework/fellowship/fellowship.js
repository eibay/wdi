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
 var middleEarth = document.getElementById("middle-earth")
  
  lands.forEach(function(land){
    var landDiv = document.createElement("div") 
    landDiv.innerText = land
    middleEarth.appendChild(landDiv)
  });
}

function makeHobbits(hobbits) {
  var hobbitsUL = document.getElementById("hobbits")

  hobbits.forEach(function(hobbit){
    var hobbitLI = document.createElement("li");
    hobbitLI.className = "hobbit";
    hobbitLI.innerText = hobbit;
    hobbitsUL.appendChild(hobbitLI);
  });
};

function keepItSecretKeepItSafe() {
  var frodo = document.getElementById("hobbits")[0];
  var ring = document.createElement("div");
  ring.id = "the-ring";
  frodo.appendChild(ring);
};

function makeBuddies(buddies) {
  var asideTag = document.createElement("aside")
  var buddiesUL = document.createElement("ul")
  
  buddies.forEach(function(buddy){
    var buddyLI = document.createElement("li");
    buddyLI.innerText = buddy
    buddiesUL.appendChild(buddyLI)
  });

  asideTag.appendChild(buddiesUL);
  var shire = document.getElementById("middle-earth").children[0];
  shire.appendChild(asideTag);

};

function beautifulStranger() {
  var strider = document.querySelector("aside").children[0].children[3];
  strider.innerText = "Aragorn";
}

function forgeTheFellowShip() {
  var buddies = document.querySelector("aside").children[0].children;
  var hobbits = document.getElementById("hobbits").children;
  var rivendell = document.getElementById("middle-earth").children[1];
  var rivendellUL=document.createElement("ul");
  rivendell.appendchild(rivendellUL);

//trying to push each li into rivendill div
    // buddies.forEach(function(buddy){
    //   rivendell.appendchild(buddy);
    // });
    // hobbits.forEach(function(hobbit){
    //   rivendell.appendchild(hobbit);
    // });

  for (var i=0; i<buddies.length; i++){
    rivendellUL.appendChild(buddies[i])
  };

  for (var i=0; i<hobbits.length; i++){
    rivendellUL.appendchild(hobbits[i])
  };
  
  var theFellowship = document.createElement("div");
  theFellowship.id = 'the-fellowship';


}






















