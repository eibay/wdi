function combineHashes(hash1, hash2) {
	var hash = {}
	var array1 = Object.keys(hash1)
	var array2 = Object.keys(hash2)
	array1.forEach(function(one) {
		hash[one] = hash1[one]
	})
	array2.forEach(function(one) {
		hash[one] = hash2[one]
	})
	return hash
}

var favoriteColors = { George: "red", Frank: "blue", Ralph: "orange", Paco: "azul" }
var favoriteShows = { Mark: "Seinfeld", Joe: "Friends", Alan: "Alice", Francois: "Merde" }

console.log(combineHashes(favoriteColors, favoriteShows))