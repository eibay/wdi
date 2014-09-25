var names = ["Jon", "Arya", "Bob", "Ned"]

function outputNames(array) {
  for(i = 0; i < array.length; i++){
    console.log("Hello " + array[i])
  }
}

outputNames(names);

var numbers = [2, 4, 6]

function double(num) {
  for(i = 0; i < num.length; i++){
    console.log(num[i] * 2)
  }
}

double(numbers)