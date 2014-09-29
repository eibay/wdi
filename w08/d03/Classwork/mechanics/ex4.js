// # Create a function that takes an array of names and returns a new array with "hello [name]" for each name

var names = ["Jon", "Arya", "Bob", "Ned"]

function outputNames(array) {
  var new_array = []
  for(i = 0; i < array.length; i++) {
  new_array.push("Hello " + array[i])
  }
  console.log(new_array)
}

outputNames(names)
