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
	// add each land as another div tag to the middle-earth div
    // inside each div tag for a land, include an h1 with the name of the land
    // append middle-earth to your document body
    var middle_earth = document.getElementById("middle-earth");
    lands.forEach(function(land){
    	var land_div = document.createElement("div");
    	var land_article = document.createElement("article");
    	var land_heading = document.createElement("h1");
    	land_heading.innerText = land;
    	land_article.appendChild(land_heading);
    	land_div.appendChild(land_article);
    	middle_earth.appendChild(land_div);
    });
};

makeMiddleEarth(lands);

function makeHobbits(hobbits) {
	// display an unordered list of hobbits in the shire
  	// give each hobbit a class of hobbit
	var hobbits_ul = document.createElement("ul");
	document.body.appendChild(hobbits_ul);
	hobbits.forEach(function(hobbit){
		var hobbit_li = document.createElement("li");
		hobbit_li.className = "hobbit";
		hobbit_li.innerText = hobbit;
		hobbits_ul.appendChild(hobbit_li);
	});
};

makeHobbits(hobbits);

function keepItSecretKeepItSafe() {
  // create a div with an id of 'the-ring'
  // add the ring as a child of Frodo
  var the_ring = document.createElement("div");
  the_ring.id = "the-ring";
  var hobbit_li = document.getElementsByClassName("hobbit");
  for(var i=0;i<hobbit_li.length;i++) {
  	if(hobbit_li[i].innerText == "Frodo Baggins") {
  		hobbit_li[i].appendChild(the_ring);
  	};
  };
};
  
keepItSecretKeepItSafe(); 

function makeBuddies(buddies) {
  // create an aside tag
  // display an unordered list of buddies in the aside
  // insert your aside before rivendell
  var aside_tag = document.createElement("aside")
  var buddies_ul = document.createElement("ul");
	document.body.appendChild(buddies_ul);
	buddies.forEach(function(buddy){
		var buddy_li = document.createElement("li");
		buddy_li.innerText = buddy;
		buddies_ul.appendChild(buddy_li);
	});
  aside_tag.appendChild(buddies_ul);
  var rivendell = document.getElementById("middle-earth").children[1];
  document.getElementById("middle-earth").insertBefore(aside_tag, rivendell);
};

makeBuddies(buddies);

function beautifulStranger() {
  // change the buddy 'Strider' textnode to "Aragorn"
  var lists = document.body.getElementsByTagName("li")
  for(var i=0;i<lists.length;i++) {
  	if(lists[i].innerText == "Strider") {
  		lists[i].innerText = "Aragorn";
  	};
  };
};

beautifulStranger();

function forgeTheFellowShip() {
  // move the hobbits and the buddies to Rivendell
  // create a new div called 'the-fellowship'
  // add each hobbit and buddy one at a time to 'the-fellowship'
  // after each character is added make an alert that they have joined your party

  
}


