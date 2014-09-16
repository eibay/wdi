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
	i=0
	while (i < lands.length){
		var lands_div = document.createElement("div");
		lands_div.id = lands[i];
		lands_div.innterHTML = "<h1> </h1>" //not doing anything
		lands_div.innerText = lands[i]

		document.body.appendChild(lands_div);
		i++;
	}
}

function makeHobbits(hobbits) {
	var shire = document.getElementById("The Shire");
	var ul = document.createElement("ul");
	shire.appendChild(ul);

	i=0
	while (i < hobbits.length) {
		var shire_hobbit = document.createElement("li");
		shire_hobbit.className = "hobbit"; 
		shire_hobbit.innerText = hobbits[i];
		
		ul.appendChild(shire_hobbit);
		
		i++
	}
}

function keepItSecretKeepItSafe() {
	var ring_div = document.createElement("div");
	ring_div.id = "the-ring";

//route to frodo
	var shire = document.getElementById("The Shire");
	var path = shire.children[0].children[0];
	path.appendChild(ring_div);

}
// stop
function makeBuddies(buddies) {
	var buddies_aside = document.createElement("aside")
	document.body.appendChild(buddies_aside)
	var ul = document.createElement("ul")
	buddies_aside.appendChild(ul)

	
		i=0
		while (i<buddies.length){
			var shire_hobbit = document.createElement("li");
			shire_hobbit.className = "buddy"
			shire_hobbit.innerText = buddies[i];
			ul.appendChild(shire_hobbit)
			i++
		}
}

function beautifulStranger() {
	var path = document.getElementsByClassName("buddy")[3]
	path.innerText = "Aragorn"

}

function forgeTheFellowShip() {
	
//rivendale = loaction of rivendale
//hobbits = location of hobbits
//hobbits.appendTo(rivendale)

//buddies = location of buddies
// buddies.appendTo(rivendale)

	var fellowship = document.createElement("div")

	i=0
	while (i<buddies.length){
//rivendale.buddy[i].appendTo( "fellowship" )
// rivendale.hobbits[i]( "fellowship" )
	
	}i++
}






