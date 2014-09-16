
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

var args = process.argv

function numsBetween(num1, num2) {
	var arrayOfNums = [];

	while (num1 < (num2 - 1)) {
		num1 += 1;
		arrayOfNums.push(num1);
	}
	return arrayOfNums;
}


console.log(numsBetween(parseInt(args[2]),parseInt(args[3])));

g 
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