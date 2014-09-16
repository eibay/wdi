// function makeMiddleEarth(lands) {
//   // add each land as another div tag to the middle-earth div
//   // inside each div tag for a land, include an h1 with the name of the land

//   var land = document.getElementById("middle-earth");

//   lands.forEach(function(land) {
//   var new_div = document.createElement("div");
//   new_div.id = land.split(" ").join("_");
//   var h1 = document.createElement("h1");
//   h1.innerText  = land;

//   new_div.appendChild(h1);
//   land.appendChild(new_div);

//  });

// }

 // makeMiddleEarth(lands);


// Dramatis Personae

var lands = ["The Shire", "Rivendell", "Mordor"];

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

function makeMiddleEarth(lands) {

  // add each land as another div tag to the middle-earth div
 // inside each div tag for a land, include an h1 with the name of the land

  var middle_earth = document.getElementById("middle-earth");

  lands.forEach(function(land) {
    var new_div = document.createElement("div");
    new_div.id = land.split(" ").join("_");
    var h1 = document.createElement("h1");
    h1.innerText = land;

    new_div.appendChild(h1);
    middle_earth.appendChild(new_div);
  });
}

 // makeMiddleEarth(lands);


function makeHobbits(hobbits) {
   // display an unordered list of hobbits in the shire
  // give each hobbit a class of hobbit
  var land = document.getElementById("The_Shire");

  hobbits.forEach(function(hobbit) {
    var ul = document.createElement("ul");
    var li = document.createElement("li");

    li.className = "hobbit";
    li.innerText = hobbit;
    ul.appendChild(li);
    land.appendChild(ul);


  });

}

 function keepItSecretKeepItSafe() {
    // create a div with an id of 'the-ring'
   // add the ring as a child of Frodo

   var hobbits = document.getElementsByClassName("hobbit");
   var frodo = hobbits[0];


   var div = document.createElement("div");

   div.id = "the-ring";
   frodo.appendChild(div);

}

 function makeBuddies(buddies) {

//   // create an aside tag
//   // display an unordered list of buddies in the aside
//   // insert your aside before rivendell



    var aside = document.createElement("aside");


    var parent = document.getElementById("middle-earth");
    console.log(parent);

    // var parent = document.insertBefore(aside, "Rivendell");

    var secondChild = document.getElementById('Rivendell');
    console.log(secondChild);

    var ul = document.createElement("ul");


  buddies.forEach(function(buddy) {


  var li = document.createElement("li");

  li.innerText = buddy;

  ul.appendChild(li)



  });

      aside.appendChild(ul)

   var insertBuddies = parent.insertBefore(aside, secondChild);

 }



// function makeHobbits(hobbits) {
//    // display an unordered list of hobbits in the shire
//   // give each hobbit a class of hobbit
//   var land = document.getElementById("The_Shire");

//   hobbits.forEach(function(hobbit) {
//     var ul = document.createElement("ul");
//     var li = document.createElement("li");

//     li.className = "hobbit";
//     li.innerText = hobbit;
//     ul.appendChild(li);
//     land.appendChild(ul);


//   });

// }






// function beautifulStranger() {
// }

// function forgeTheFellowShip() {
// }