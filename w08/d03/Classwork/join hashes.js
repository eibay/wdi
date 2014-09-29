// Create a function that takes two hashes and combines the elements


var pplFavColor = {Tess: "Black", Iris: "Aqua", Nastassia: "Green", Tejal: "Red"}

var otherPplFavColor = {Sean:"black", Joe: "black", Adrian: "Crimson"}

var namesArray = Object.keys(otherPplFavColor)

function joinHashes(one, two){
	for (var i=0;i<namesArray.length;i++){
		pplFavColor[namesArray[i]] = otherPplFavColor[namesArray[i]];
	}
}


joinHashes(pplFavColor, otherPplFavColor)
console.log(pplFavColor)
