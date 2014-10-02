var fs = require('fs');


var titanicArr = fs.readFileSync('./titanic.txt').toString().split(", ");
var inceptionArr = fs.readFileSync('./inception.txt').toString().split(", ");


// var same = []
// var sameActor = function(arr1, arr2) {
// 	arr1.forEach(function(actor) {
// 		arr2.forEach(function(actor2) {
// 			if (actor == actor2) {
// 				same.push(actor);		
// 			}
// 		})
// 	})
// 	console.log(same)
// }

var same = []
var sameActor = function(arr1, arr2) {
	arr1.forEach(function(actor) {
		if (arr2.indexOf(actor) != -1) {
			same.push(actor)
		}
	})
	console.log(same)
}


sameActor(titanicArr, inceptionArr)



