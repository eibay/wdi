var favoriteColors = { George: "red", Frank: "blue", Ralph: "orange", Paco: "azul"}

function everyonesFavorite(hash) {
	var everyone = Object.keys(hash)
	everyone.forEach(function(one) {
		console.log(one + "'s favorite color is " + hash[one])
	})
}
