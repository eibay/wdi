function inArray(array, num) {
  for (i=0; i<array.length; i++) {
    if(array[i] == num) {
      console.log(true);
    } else if (array[i] != num) {
      console.log(false);
      }
    }
  }


inArray([5, 3, 4, 6], 6)
