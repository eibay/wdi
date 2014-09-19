
var word = "what";
var word_array = word.split("")
var answer_array = [];
var plays = 0

for (var i = 0; i < word_array.length; i++){
     answer_array.push("")};
console.log(answer_array)
var turn = function(letter){
	for (var i = 0; i < word_array.length; i++){
   if(letter == word_array[i]){
      answer_array[i] = letter
    };
  };
  plays++
  console.log(answer_array);
  response()

};

var response =function(){

 	if (answer_array.indexOf("") == -1) {
 		console.log("you win")
 	} else if(plays > 8){
 		console.log("you lose")
 	} else if (plays < 8){
 		console.log('guess again!')
 	} else{
 		console.log('you lose')
 	};

};
