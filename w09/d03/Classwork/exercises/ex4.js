var arrayOne = ["Robocop", "Hercules", "John", "Bob"]

var arrayTwo = ["Joker", "Riddler", "Twoface"]

var arrayThree = ["Dude"]

function combine(one, two) {

  // parameter one is arraytwo and parameter two is arraythree

    var mixedArray = one

    for(var i = 0; i < two.length; i++) {

        mixedArray.push(two[i])
    }

    // above pushes the contents of arraythree into arraytwo, now we have to push the contents of arrayone in too them both.

      return mixedArray;

}

function combineAll(array1, array2, array3) {

var capture = combine(x, y)
var captureAll = combine(z, d)

return e;

}

var capture = combine(arrayOne, arrayTwo, arrayThree)
var captureAll = combine(arrayOne, capture)
console.log(captureAll)



var firstAnswer = combineAll(arrayOne, arrayTwo, arrayThree)
var secondAnswer = combineAll([1,2], [5,6], [4,9])

var one = [3,4,5,6]
var two = [2,8,9]
var three = [1,9,0]

var thirdAnswer = combineAll(one, two, three)



