// Create a function that takes two hashes and combines the elements


var places = { "City": "New York City", "Country": "Scotland", "Continent": "Africa" }
var movies = { "Action": "Raiders of the Lost Ark", "Drama": "Howard's End", "Comedy": "Life of Brian" }

function combineElements(hash1, hash2) {
	var keys = Object.keys(hash1);
	for (var i = 0; i < keys.length; i++) {
	hash1[keys[i]] = hash2[keys[i]]
	}
	return hash2;
};



