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
	var div = document.createElement("div");
  div.id = "middle-earth";
  lands.forEach(function(land) {
    var child = document.createElement("div");
    heading = document.createElement("h1");
    heading.innerText = land;
    child.appendChild(heading);
    div.appendChild(child);
  })
  document.body.appendChild(div);
}

function makeHobbits(hobbits) {
  var list = document.createElement("ul");
  hobbits.forEach(function(hobbit) {
    var el = document.createElement("li");
    el.className = "hobbit";
    el.innerText = hobbit;
    list.appendChild(el);
  })
  document.body.appendChild(list);
}

function keepItSecretKeepItSafe() {
  var ring = document.createElement("div");
  ring.id = "the-ring";
  var els = document.getElementsByClassName("hobbit");
  els[0].appendChild(ring);
}

function makeBuddies(buddies) {
  var aside = document.createElement("aside");
  var ul = document.createElement("ul");
  buddies.forEach(function(buddy) {
    el = document.createElement("li");
    el.innerText = buddy;
    ul.appendChild(el);
  })
  aside.appendChild(ul);
  arr = document.getElementsByTagName("h1");
  arr[0].parentNode.appendChild(aside);
}

function beautifulStranger() {
  list = document.getElementsByTagName("li");
  for(i = 0; i < list.length; i++) {
    if (list[i].innerText == "Strider") {
      list[i].innerText = "Aragorn"
    }
  }
}

function forgeTheFellowShip() {
  var humans = document.getElementsByTagName("aside")[0].children[0];
  var middleEarth = document.getElementsByTagName("h1")[0].parentNode.parentNode;
  middleEarth.children[1].appendChild(humans);
  var hobbs = document.getElementsByClassName("hobbit")[0].parentNode;
  middleEarth.children[1].appendChild(hobbs);
  div = document.createElement("div");
  div.id = "the-fellowship";
  middleEarth.children[1].appendChild(div);
  setTimeout
  while (hobbs.children.length > 0) {
    console.log(hobbs.children[0].innerText + " has joined your party.")
    div.appendChild(hobbs.children[0]);
  }
  while (humans.children.length > 0) {
    console.log(humans.children[0].innerText + " has joined your party.");
    div.appendChild(humans.children[0]);
  }
}


console.log("script has loaded");

// makeMiddleEarth(lands)
// makeBuddies(buddies)
// makeHobbits(hobbits)

