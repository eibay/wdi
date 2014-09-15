var friends = ["Joey", "Phoebe", "Chandler", "Rachel", "Monica", "Ross"];

var myEach = function(arr, theFunctionWePassIn) {
  for (i = 0; i < arr.length; i++)
    theFunctionWePassIn(arr[i]);
};

var shmee = function(monkey_eggs) {
  console.log("I love the character " + monkey_eggs);
}

myEach(friends, shmee)

// What is the function myEach going to do?

// It takes the first argument as an array and second the function

// We r saying lets pass in some data and lets pass in some work and pass in work on each piece of data and let the function take care of the iterations on each piece of data

// Functions were passed into functions here bascially.