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

var combination = combine(arrayThree, arrayTwo)
var x = combine(arrayOne, combination)
console.log(x)

