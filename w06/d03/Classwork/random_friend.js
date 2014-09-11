function random_friend(){
	var friends = ["Joey", "Chandler", "Pheobe", "Ross", "Rachel", "Monica"]
	var random = friends[Math.floor(Math.random()*friends.length)];
	return random
}


console.log(random_friend());