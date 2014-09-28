// Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
// Create a function that takes a hash of favorite colors and uses Object.keys to print out "[name] favorite color is [color]" for each name

var hash = { "Brenda": "red", "Shirley": "purple", "Macy": "pink" }

function faveColors(hash) {
	var keys = Object.keys(hash);

	for (var i = 0; i < keys.length; i++) {
		console.log(keys[i] + "'s favorite color is " + hash[keys[i]] + ".");
	}
};

faveColors(hash);