var matches = []
var wrongs = []
var word = "poodle"
var blank = []

function matchGuess(letter, word){
for(var i=0; i<word.length; i++) {
    if (letter == word[i]) {
      matches.push(letter);
  		}  
	else 
	{wrongGuess(letter);} 
	} 
};

 function wrongGuess(letter) {
 	for(var j = 0; j <= wrongs.length; j++) {
 		if (wrongs.indexOf(letter) == -1) {
 		wrongs.push(letter);
 	}
 }}

