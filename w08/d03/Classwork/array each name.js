// Create a function that takes an array of names and returns a new array with "hello [name]" for each name

arrayOfNames = ["Spot", "Waffles", "Pluto"]

var newArray = arrayOfNames.map(function(name){

	return "hello " + name

})

console.log(newArray)