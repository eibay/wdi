


var shmee = function(shmo) {
	console.log("I love the character" + " " + shmo)
}


var myEach = function(ary, shmee) {
	for(i = 0; i < ary.length; i++) {
		console.log(shmee(ary[i]))
	};
};




myEach(["adam", "bob", "carol"], "My name is");

friends = ["adam", "bob", "carol"];


myEach(friends, shmee);