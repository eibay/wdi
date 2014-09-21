var matches = []
var wrongs = []
var dashArray = []

//stuff to get random word
var xhr = new XMLHttpRequest;
xhr.open('GET', 'http://api.wordnik.com/v4/words.json/randomWord?minCorpusCount=10000&minDictionaryCount=20&excludePartOfSpeech=proper-noun,proper-noun-plural,proper-noun-posessive,suffix,family-name,idiom,affix&hasDictionaryDef=true&includePartOfSpeech=noun,verb&limit=26&maxLength=7&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5');
xhr.send();

// once i have random, assign it to word var
xhr.addEventListener('load', function() {
	var json = JSON.parse(xhr.response);
	word = json["word"];
	// after the API call comes back with a word, set the dashes, add eventListener to guessbutton
	// set event listener on letter-guess-button
  dashAdd(word);
	var guessbutton = document.getElementById('guess-button');	
	guessbutton.addEventListener('click', guessLetter);
});

// set letter guess with button
// no longer replaces dash in dashArray because now it can't find dashArray
function guessLetter() {
	var inputLetter = document.querySelector('input#letter');
	var letter = inputLetter.value;
	matchGuess(letter, word, wordDiv);
};

// fills word div with blanks
function dashAdd(word) {
	var dashArray = []
	var wordDiv = document.querySelector('div.game-word');
		// count number of letters in word
		// fill wordDiv with that many underscore chars
		for (i=0; i < word.length; i++) {
		dashArray.push("_");
		dashArrayNoCommas = dashArray.join('');
		wordDiv.innerText = dashArrayNoCommas;		
	}	return wordDiv;
};

// finds all matches and replaces dashes
// calls function to put wrong guess in an array
function matchGuess(letter, word, wordDiv){
	for(var i=0; i<word.length; i++) {
	  if (letter == word[i]) {
			dashArray.splice(i, 1, letter);
			var dashArrayNoCommas = dashArray.join('');
			wordDiv.innerText = dashArrayNoCommas;
			}  
		else {
			wrongGuess(letter);
			displayWrongs(wrongs);
		}
	} 
};

// but it's pushing rights, too, because of matchGuess else!! later for that
 function wrongGuess(letter) {
 	for(var j = 0; j <= wrongs.length; j++) {
 		if (wrongs.indexOf(letter) == -1) {
 		wrongs.push(letter);
 		wrongs.sort();
 	}
 }};


// put wrongs in guessed-letters span
function displayWrongs(wrongs) {
	var wrongSpan = document.querySelector('span.guessed-letters');
	var wrongsWithSpace = wrongs.join(', ');
	wrongSpan.innerText = wrongsWithSpace;
};

