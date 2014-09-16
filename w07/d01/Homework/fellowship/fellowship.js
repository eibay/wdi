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

function makeMiddleEarth(lands){
lands.forEach(function(land){
  var middle= document.getElementById("middle-earth")
  var element = document.createElement("div")
  var elementh1 = document.createElement("h1")
  elementh1.innerText = land
  element.appendChild(elementh1)
  middle.appendChild(element)

  })
}

function makeHobbits(hobbits){
  hobbits.forEach(function(hobbit){ 
   var unorder =  document.createElement("ul")
   var list = document.createElement("li")
   list.innerText = hobbit
   list.setAttribute("class", "hobbit")
   unorder.appendChild(list)
   document.body.appendChild(unorder)

  })
}

function keepItSecretKeepItSafe(){
  var ring = document.createElement("div")
  var frodo = document.getElementsByClassName("hobbit")[0]
  ring.id = "the-ring"
  frodo.appendChild(ring)

}

function makeBuddies(buddies){
  var tag = document.createElement("aside")
  var unorder = document.createElement("ul")
  buddies.forEach(function(buddy){
    var list = document.createElement("li")
    list.innerText = buddy
    unorder.appendChild(list)
  })
  tag.appendChild(unorder)
  var middle = document.getElementById("middle-earth")
  var placement = middle.children[1]
  middle.insertBefore(tag,placement)

}

function beautifulStranger(){
  var searches = document.getElementsByTagName("li")
  var i = 0
  //ask why cant you use a forEach

  while (i < searches.length){
    if (searches[i].innerText == "Strider"){
      searches[i].innerText = "Aragorn"
      }
      i ++
    }
}


function forgeTheFellowShip(){
  var hobbits = document.getElementsByClassName("hobbit")
  var newdiv = document.createElement("div", "the-fellowship")
  var buddies = document.getElementsByTagName("li")
  var middle = document.getElementById("middle-earth")
  var placement = middle.children[2]
  placement.children[0].appendChild(newdiv)
  var i = 0
  while (i < 5){
  alert(buddies[0].innerText + " has joined");
  newdiv.appendChild(buddies[0])

    
    i ++
  }

  var i = 0
   while (i < hobbits.length){
    alert(hobbits[i].innerText + " has joined");
    newdiv.appendChild(hobbits[i])
    i ++
  }

}