// var arrayOne = ["Robocop", "Hercules"]

// var arrayTwo = ["Joker", "Riddler"]

// function combine(one, two) {

//     var mixedArray = []

//     for(var i = 0; i < one.length; i++) {

//         mixedArray.push(one[i])
//     }

//     for(var i = 0; i < two.length; i++) {

//         mixedArray.push(two[i])
//     }

//       return mixedArray;

//   }

// console.log(combine(arrayOne, arrayTwo))

var arrayOne = ["Robocop", "Hercules", "John"]

var arrayTwo = ["Joker", "Riddler"]

function combine(one, two) {

    var mixedArray = one

    for(var i = 0; i < two.length; i++) {

        mixedArray.push(two[i])
    }

      return mixedArray;

}


console.log(combine(arrayOne, arrayTwo))

