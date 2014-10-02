var arrayOne = ["Robocop", "Hercules", "John", "Bob"]
var arrayTwo = ["Joker", "Riddler", "Twoface"]
var arrayThree = ["Dude"]

////////////////////////////////

function combine(one, two) {

  var mixedArray = one

  for(var i = 0; i < two.length; i++) {

      mixedArray.push(two[i])
  }

  return mixedArray;
}


////////////////////////////////

function combineAll(array1, array2, array3) {

  var capture = combine(array1, array2)
  var captureAll = combine(capture, array3)

  return captureAll;

}

////////////////////////////////

var arrayOneTwoThreeAnswer = combineAll(arrayOne, arrayTwo, arrayThree)

console.log(arrayOneTwoThreeAnswer)

////////////////////////////////

var answer1 = combineAll([50, 1], [100, 2], [150, 4])
console.log(answer1)


