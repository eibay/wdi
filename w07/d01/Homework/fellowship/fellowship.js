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
	var middle_earth=document.getElementById('middle-earth');

	lands.forEach(function(land){
		var the_land=document.createElement('div');
		the_land.id=land.split(" ").join("");
		var header=document.createElement('h1');
		header.innerText=land;
		the_land.appendChild(header);
		middle_earth.appendChild(the_land);
	});
}
 
function makeHobbits(hobbits) {
	var the_shire=document.getElementById("TheShire");
	var new_list=document.createElement('ul');
	new_list.id="hobbits";
	hobbits.forEach(function(hobbit){

		var new_hobbit=document.createElement('li');
		new_hobbit.innerText=hobbit;
		new_hobbit.className="hobbit";
		new_list.appendChild(new_hobbit);
});
	the_shire.appendChild(new_list);
}

function keepItSecretKeepItSafe() {
	var frodo=document.getElementsByClassName("hobbit")[0];
	var the_ring=document.createElement('div');
	the_ring.id="the-ring";
	frodo.appendChild(the_ring)
}

function makeBuddies(buddies) {
	var aside=document.createElement('aside');
	var new_list=document.createElement('ul');
	new_list.id="buddies";
	aside.appendChild(new_list);
	buddies.forEach(function(buddy){
		var new_buddy=document.createElement('li');
		new_buddy.innerText=buddy;
		new_buddy.className="buddy";
		new_list.appendChild(new_buddy);
	});
	var middle_earth=document.getElementById('middle-earth');
	var rivendell=document.getElementById('Rivendell');
	middle_earth.insertBefore(aside, rivendell); 
}

function beautifulStranger() {
	var strider=document.getElementsByClassName("buddy")[3];
	strider.innerText="Aragorn";
}

function forgeTheFellowShip() {
	var middle_earth=document.getElementById('middle-earth');
	var the_hobbits=document.getElementById("hobbits");
	var rivendell=document.getElementById('Rivendell');
	var shire=document.getElementById('TheShire');
	var the_buddies=document.getElementById("buddies");
	var move_hobbits=the_hobbits.cloneNode(true);
	var move_buddies=the_buddies.cloneNode(true);
	the_hobbits.parentNode.removeChild(the_hobbits);
	the_buddies.parentNode.removeChild(the_buddies);
	rivendell.appendChild(move_hobbits);
	rivendell.appendChild(move_buddies);
	var the_fellowship=document.createElement("div");
	the_fellowship.name="the_fellowship";
	the_fellowship.id="the_fellowship";
	middle_earth.appendChild(the_fellowship);
	fellowship_head=document.createElement("h1");
	fellowship_head.innerText="The Fellowship";
	the_fellowship.appendChild(fellowship_head);
	fellowship_list=document.createElement("ul");
	the_fellowship.appendChild(fellowship_list);
	
	hobbits.forEach(function(hobbit){
		new_hobbit=document.createElement('li');
		new_hobbit.innerText=hobbit;
		fellowship_list.appendChild(new_hobbit);
		window.alert(hobbit+' has joined the fellowship');
	});
	
	buddies.forEach(function(buddy){
		new_buddy=document.createElement('li');
		new_buddy.innerText=buddy;
		fellowship_list.appendChild(new_buddy);
		window.alert(buddy+' has joined the fellowship');
	});
}

function doEverything(){
	makeMiddleEarth(lands);
	makeHobbits(hobbits);
	keepItSecretKeepItSafe();
	makeBuddies(buddies);
	beautifulStranger();
}


