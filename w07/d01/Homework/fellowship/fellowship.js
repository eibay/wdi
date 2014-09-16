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
  lands.forEach(function(land){
    var parentDiv = document.getElementById("middle-earth");
    var land_div = document.createElement("div");
    var divs = parentDiv.appendChild(land_div);
    var header = land_div.innerText = document.createElement("h1");
    divs.appendChild(header);
    header.innerText = land;
  })
}

function makeHobbits(hobbits) {
  var hobbit_ul = document.createElement("ul");
  hobbit_ul.id = "hobbitList";
  for(var i=0;i<hobbits.length;i++){
    var hobbit = document.createElement("li");
    hobbit.className = "hobbit";
    hobbit.innerText = i;
    hobbit_ul.appendChild(hobbit);
  }
}

function keepItSecretKeepItSafe() {
  var makeDiv = document.createElement("div");
  makeDiv.id = 'the-ring';
  var makeDiv2 = document.createElement("div");
  makeDiv2.appendChild(makeDiv);
}

function makeBuddies(buddies) {
  var aside = document.createElement("aside");
  var list = document.createElement("ol");
  for(var i = 0;i<buddies.length;i++){
    var list_el = document.createElement("li");
    list_el.innerText = buddies[i];
    list.appendChild(list_el);
  }
  aside.appendChild(list);
}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}
