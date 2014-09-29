// Create a function that takes an array of names and console.logs "hello name" for each name


var arrayOfNames = ["Spot", "Waffles", "Pluto"]

var newArray=[]
function allNames(array){
	for (var i=0; i<array.length; i++){
		newArray.push("Hello " + array[i])
	} return newArray
}
console.log(allNames(arrayOfNames))