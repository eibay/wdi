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

function dashAdd(word) {
	wordDiv = document.querySelector('div.game-word');
	dashArray = []
		// count number of letters in word
		// fill wordDiv with that many underscore chars
		for (i=0; i < word.length; i++) {
		dashArray.push("_");
		dashArrayNoCommas = dashArray.join('');
		wordDiv.innerText = dashArrayNoCommas;
		
	}

}
