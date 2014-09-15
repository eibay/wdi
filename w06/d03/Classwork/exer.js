var args = process.argv 
function altTwixt(x,y) {
  var i = 1;
  while(i < y - x) {
    console.log(x+i)
    i = i + 1;
  }
}

altTwixt(parseInt(args[2]), parseInt(args[3]));


// node filename.js argument1 argument2 ... argument n