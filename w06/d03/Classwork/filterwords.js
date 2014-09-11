// Write a function filterLongWords that takes an array of words and an integer i and returns the array of words that are longer than i.

function filterLongWords(integer, array) {

    var n = 0

     while (n < array.length) {

    if (array[n].length > integer) {

       console.log(array[n]);
    }

    n+=1

   }
}

filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])

// above code creates a function with the name filterLongWords and sets two attributes to it(integer, array)
//it creates a variable by the name of n and sets it equal to the value of 0
 // starts a while loop and says while n which is 0 is less than the length of our array which is 5, do certain actions
 // the above is a conditional and says if the array at index position[0] to start with is greater than the integer value, console.log that element.
 // the above is an incrementor that and goes up by one for each iteration until n which is 0 is no longer less than 5.

