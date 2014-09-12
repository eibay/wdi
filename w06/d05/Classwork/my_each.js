var friends = ["Joey", "Phoebe", "Chandler", "Rachel", "Monica", "Ross"];

var shmee = function(monkey_eggs) {
	console.log("I love the character " + monkey_eggs);
}

var myEach = function(arr, theFunctionWePassIn) {
	for(i=0;i<arr.length;i++) {
		if (arr[i] == "Joey") {
			theFunctionWePassIn(arr[i]);
		} else if (arr[i] == "Phoebe") {
			theFunctionWePassIn(arr[i]);
		};
	};
};

myEach(friends, shmee);

//I love the character Joey
//I love the character Phoebe