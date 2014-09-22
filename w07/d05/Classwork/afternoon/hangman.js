var matches = []
var wrongs = ["x"]
var word = 
var blank = []


function matchGuess(letter, word){
	for(var i=0; i<word.length; i++) {
		if (letter == word[i]) {
			matches.push(letter);
		}  
	} return matches;

}


function wrongGuess(letter) {
	for(var j = 0; j <= wrongs.length; j++) {
		if (wrongs.indexOf(letter) == -1) {
			wrongs.push(letter);
		}
	} 
}


function noDupesInMisses(letter, array){
	for(var m = 0;m<=array.length;m++) {
		if (array.indexOf(letter) == -1){
			array.push(letter);
		}
	}
}

function dashAdd(word){
	wordDisplay = document.getElementsByClass('game-word');
	//count number of letters in a word
}



};