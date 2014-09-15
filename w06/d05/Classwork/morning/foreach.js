var friends = ["Joey", "Phoebe", "Chandler", "Rachel", "Monica", "Ross"]
var i = 0

var myEach = function(arr, theFunctionWePassIn){
  while (i < arr.length) {
   theFunctionWePassIn(someArray[i]);
   i++
  }
}

var schmee = function(monkey_eggs) {
	console.log("I love the character " + monkey_eggs);
}

var blah = function(element) {
	console.log("Also yea, sure ..." + element);
}

myEach([1,2,3,4,5], blah);

var friends = ["Joey", "Phoebe", "Chandler", "Rachel", "Monica", "Ross"];

myEach(friends, schmee);

//I love the character Joey
//I love the character Chandler