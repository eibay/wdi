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


function toDashed(str) {
  return str.replace(/\s+/g, '-').replace(/\"|\'/g, '').toLowerCase();
}

function makeMiddleEarth(lands) {
  // create a section tag with an id of middle-earth
  var middleEarth = $("<section id='middle-earth'>");
  // add each land as an article tag
  // inside each article tag include an h1 with the name of the land
  for (var i=0; i<lands.length; i++) {
    var id = toDashed(lands[i]);
    var land = document.getElementBy("<div id='" + id + "'>");
    //var container = document.querySelector('#container');
    land.append($("<h1>"+lands[i]+"</h1>"));
    land.appendTo(middleEarth);
  }
  $("body").append(middleEarth);

function makeHobbits(hobbits) {
}

function keepItSecretKeepItSafe() {
}

function makeBuddies(buddies) {
}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}