function check(letter) {
  var allLetters = {};
  for(var i= 0; i < letter.length; i++) {
    var character = letter.charAt(i);
    if(character in allLetters) {
      allLetters[character] += 1;
    }
    else {
    	allLetters[character] = 1;
    }
  }if (allLetters.hasOwnProperty(" ")){
  	delete allLetters[" "]
  	return allLetters;
  }else {
  	return allLetters;
  }
};

var a = check("HELLO THERE");
console.log(a)