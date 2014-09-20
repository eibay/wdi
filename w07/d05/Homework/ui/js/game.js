
var secretWord="GOOSE";
var secretWordArray=secretWord.split('');
var length=secretWord.length;
var guesses=6;
var guessed_wrong=[];
var guessed_right=[];
var matched_letters=[];


if(localStorage.getItem('wins') == null){
	localStorage.setItem('wins', 0)
	var wins=localStorage.getItem('wins');
	var winsHtml=document.getElementById('wins');
	winsHtml.innerText='Wins: '+wins;
	}
else{
	var wins=localStorage.getItem('wins');
	var winsHtml=document.getElementById('wins');
	winsHtml.innerText='Wins: '+wins;
}

function letterInWord(letter, word){
	
	if(word.indexOf(letter) != -1){
			guessed_right.push(letter)
			return true;
			}else{
	guessed_wrong.push(letter)
	return false;
	}
}

function guessed(letter){
	if(guessed_wrong.join('').match(letter)||guessed_right.join('').match(letter)){
		return true;
	}else{
		return false
	}
}

function letterPositions(letter, array){
	var indexes=[]
 		for(var i=0; i < array.length; i++){

 			if (array[i]==letter){
 				indexes.push(i)

 			}
 		}



 			return indexes;
}

 function makeGuess(letter){
 	if(guesses > 1){
	 	if(guessed(letter)==false){
	 		if(letterInWord(letter, secretWord)==true){
	
	 			var guesses_left=document.getElementById('guesses-left');
	 			guesses_left.innerText=guesses;
	 			var letters=letterPositions(letter, secretWordArray);	
	 			for(var i=0; i < letters.length; i++){
	 				var letterPosition=document.getElementById('l'+letters[i])	
	 				letterPosition.innerText=secretWordArray[letters[i]]
	 				matched_letters.push(i);
	 			}
	 			youWon()

	 		}else{
	 			guesses=guesses-1
	 			var guesses_left=document.getElementById('guesses-left');
	 			guesses_left.innerText=guesses;
	 			wrongGuess();
	 			addBodyPart()
	 			// window.alert('Guess Again')
	 		}
	 	}else{
	 		window.alert("You already guessed that letter")
	 	}
	}
	else{
		guesses=0;
		var guesses_left=document.getElementById('guesses-left');
	 			guesses_left.innerText=0;
		var game_word=document.getElementById('game-word');
		game_word.innerHTML='Out Of Guesses!'
		addBodyPart()
		setTimeout(restart, 1500)
	}
 }
function outputString(word) {
	var gameWord=document.getElementById('game-word')
	for(var i = 0; i < word.length; i++) {

		var new_span=document.createElement('div');
		new_span.className='correctletter';
		new_span.id='l'+i;
		new_span.innerText="#";
		gameWord.appendChild(new_span);
} 	
}

function youWon(){
	if(matched_letters.length==secretWordArray.length){
		var game_word=document.getElementById('game-word');
		game_word.innerHTML='You Won!'
		var current_wins=parseInt(localStorage.getItem('wins'));
		localStorage.setItem('wins', current_wins+1)
		wins=localStorage.getItem('wins');
		var winsHtml=document.getElementById('wins');
		winsHtml.innerText='Wins: '+wins;
		setTimeout(restart, 1500)
	
	}
}
function giveUp(){
	var gameWord=document.getElementById('game-word');
	gameWord.innerHTML=''
	var letters=document.getElementById('letters');
	var guessed=document.getElementById('guessed');
	letters.innerHTML=' <span>Letters</span><br>';
	guessed.innerHTML='<span>Letters Guessed Already:</span><br>';
	guesses=0;
}

function makeAlphabet(){
	var letters=document.getElementById('letters');
	for (var idx='A'.charCodeAt(0),end='Z'.charCodeAt(0); idx <=end; ++idx)
		{
			var new_letter=document.createElement('span');
			new_letter.className='letter';
			new_letter.id=String.fromCharCode(idx);
			new_letter.innerText=String.fromCharCode(idx);
			new_letter.addEventListener('click', function(event){
				makeGuess(event.target.innerText)
				var guessed=document.getElementById('guessed');
				var moved=event.target.cloneNode(true)
				guessed.appendChild(moved);
				letters.removeChild(event.target)

			});
			letters.appendChild(new_letter);
		}

}

function wrongGuess(){
	var game_word=document.getElementById('game-word');
	var game_html=game_word.innerHTML;
	game_word.innerHTML='Guess Again';
	var wrong_timeout=function(){
		game_word.innerHTML=game_html
	}
	setTimeout(wrong_timeout,700)

}



// var give_up=document.getElementById('give-up');
// give_up.addEventListener('click', function(){
// 	restart();
	
// });

var newGame=document.getElementById('new-game');
newGame.addEventListener('click', function(){
	restart()
});

function restart(){
	var game_word=document.getElementById('game-word');
		game_word.innerHTML='New Game'
		
	var waitForThis=function(){
		giveUp()
		makeAlphabet()
		outputString(secretWord);
		guesses=6;
		var guesses_left=document.getElementById('guesses-left');
	  guesses_left.innerText=guesses;
	  guessed_wrong=[];
	  guessed_right=[];
	  matched_letters=[]
	  var top=document.getElementById('top')
	  top.innerHTML='';
	  top.style.marginTop='110px'
	  var legs=document.getElementById('legs')
	  legs.innerHTML='';
	  legs.style.marginTop='210px'
	  var feet=document.getElementById('feet')
	  feet.innerHTML='';
	  feet.style.marginTop='350px'
	}
	setTimeout(waitForThis, 1000)
}
function addBodyPart(){

	if (guesses==5){
		var feet=document.getElementById('feet')
		var foot=document.createElement('img');
		foot.src='./HipsterParts/rightfoot.png'
		foot.id='rightfoot'
		feet.appendChild(foot)
	}
	else if(guesses==4){
		var feet=document.getElementById('feet')
		var foot=document.createElement('img');
		foot.src='./HipsterParts/leftfoot.png'
		foot.id='leftfoot'
		feet.appendChild(foot)

	}
	else if(guesses==3){
		var legs=document.getElementById('legs')
		var leg=document.createElement('img');
		leg.src='./HipsterParts/rightleg.png'
		leg.id='rightleg'
		legs.appendChild(leg)
		var feet=document.getElementById('feet')
		feet.style.margin='0px'
	}
	else if(guesses==2){
		var legs=document.getElementById('legs')
		var leg=document.createElement('img');
		leg.src='./HipsterParts/leftleg.png'
		leg.id='leftleg'
		legs.appendChild(leg)
	}
	else if(guesses==1){
		var top=document.getElementById('top')
		var chest=document.createElement('img');
		chest.src='./HipsterParts/body.png'
		chest.id='chest'
		top.appendChild(chest)
		var legs=document.getElementById('legs')
		legs.style.margin="0px"
	}
	else if(guesses==0){
		var top=document.getElementById('top')
		var chest=document.getElementById('chest')
		var head=document.createElement('img');
		head.src='./HipsterParts/head.png'
		head.id='head'
		top.insertBefore(head, chest)
		top.style.margin='0px';
	}
}









 
