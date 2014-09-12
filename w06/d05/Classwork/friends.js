var friends = ["Joey", "Phoebe", "Chandler", "Rachel", "Monica", "Ross"]

function myEach(arr, theFunctionWePassIn){
arr.forEach(function(friend) {
theFunctionWePassIn(friend)

})

}

function shmee(monkey_eggs){
console.log("I love the character" + " " + monkey_eggs)

}

myEach(friends, shmee);