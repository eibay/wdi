function filterLongWords(i, a) {

  var n = 0
  while (n < a.length) {
    if (a[n].length > i) {
      console.log(a[n]);
    }
    n+=1
  }
}

filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])