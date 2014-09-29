// Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
// Create a function that takes a hash of favorite colors and uses Object.keys to print out "[name] favorite color is [color]" for each name


var pplFavColor = {Tess: "Black", Iris: "Aqua", Nastassia: "Green", Tejal: "Red"}



function favColor(hash){
	var array =[]
	var len = Object.keys(hash).length
	var key = Object.keys(hash)

	for (var i = 0; i<len; i++){
		array.push(key[i] + "'s favorite color is " + pplFavColor[key[i]])
	} return array
}

console.log(favColor(pplFavColor))

