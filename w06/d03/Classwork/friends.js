// Write a command line app that returns a name randomly chosen from the cast of friends

// $ cast
// # Jennifer Anniston
// $ cast
// # Mathew Perry

var array = ["Jennifer", "Matthew", "Matt", "David", "Courtney", "Lisa"]

var cast = array[Math.floor(array.length * Math.random())]

console.log(cast)