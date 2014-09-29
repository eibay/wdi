var fs = require('fs')
var titanic = fs.readFileSync('./titanic.txt')
titanic = String(titanic)
var titanicArray = []
var inception = fs.readFileSync('./inception.txt')
inception = String(inception)
var inceptionArray = []
var splitter = function(string) {
	var array = string.split(", ")
	return array
}
titanicArray = splitter(titanic)
inceptionArray = splitter(inception)
similarActors = []
// var compare = function(array1, array2, emptyarray) {
// 	for(var i=0; i < array1.length; i++) {
// 		for(var x=0; x < array2.length; x++)
// 			if (array1[i] == array2[x]) {
// 				emptyarray.push(array1[i])
// 			}
// 	}
// 	return emptyarray
// }

// compare(titanicArray, inceptionArray, similarActors)
inceptionArray.forEach(function(actor){

	titanicArray.forEach(function(other_actor){
		if (actor == other_actor) {
			similarActors.push(actor);
		}
	})
})
console.log(similarActors)
