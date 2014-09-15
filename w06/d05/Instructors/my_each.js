var myEach = function(someArray, theFunctionWePassIn) {
  var i = 0;

  while (i < someArray.length) {
    theFunctionWePassIn(someArray[i]);

    i++
  }
}

var shmee = function(monkey_eggs) {
  console.log("I really enjoy..." + monkey_eggs);
}

var blah = function(element) {
  console.log("Also yea, sure...." + element);
}

myEach([1,2,3,4,5], blah);

var friends = ["Joey", "Phoebe", "Chandler", "Rachel", "Monica", "Ross"];

myEach(friends, shmee);


// I love the character Joey
// I love the character Phoebe