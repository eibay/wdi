
var numbers = [1, 2, 3, 4]

function num(number, array) {
  for(i = 0; i < array.length; i++) {
    if (array[i] == number) {
      console.log("True")
    } else if(array[i] != number) {
      console.log("False")
    } else
        console.log("Error")

    }
  }


num(numbers)
