var matches = []
var wrongs = []
var word = "poodle"
var letter = "o"

// fills word div with blanks
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
};

// finds all matches and puts them in an array
// calls function to put wrong guess in an array
function matchGuess(letter, word){
for(var i=0; i<word.length; i++) {
    if (letter == word[i]) {
		dashArray.splice([i], 1, letter);
		console.log(dashArray);
		dashArrayNoCommas = dashArray.join('');
		wordDiv.innerText = dashArrayNoCommas;
  		}  
	else 
	{wrongGuess(letter);} 
	} 
};

 function wrongGuess(letter) {
 	for(var j = 0; j <= wrongs.length; j++) {
 		if (wrongs.indexOf(letter) == -1) {
 		wrongs.push(letter);
 		wrongs.sort();
 	}
 }};


