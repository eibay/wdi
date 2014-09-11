function filterLongWords(int, array){
  // var words = []
  // for (i in array){
  //   if (i.length > int)
  //     words.push(i);
  //   }
  // }
  // console.log(words);

  var words = []
  var index = 0
  while (index < array.length){
    if (array[index].length > int){
      words.push(array[index]);
    }
    index++;
  }
  console.log(words);
};

filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])
