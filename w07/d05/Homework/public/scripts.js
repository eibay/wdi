  function getRandomWord(word) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://api.wordnik.com/v4/words.json/randomWord?hasDictionaryDef=false&minCorpusCount=0&maxC...');

    xhr.addEventListener('load', function(){
      console.log(xhr.response);
      console.log(typeof xhr.response);
      parsedWord = JSON.parse(xhr.response);
      console.log(parsedWord);
      return secretWord(parsedWord["word"]);
        });


  function theWord(correctArray, word){
    word.split("")

  }
 


function incorrect(word, letter, incorrectArray1){
  if( word.indexOf(letter) == -1){
     incorrectArray.push(letter)
    console.log(incorrectArray)

  }
  return incorrectArray1
}

function correct (word, letter, indexValues1){
 
  if (word.indexOf(letter) != -1){
     
    for(i = 0; i < word.length; i++){
      if (word[i] == letter){
        indexValues.push(i)
        console.log(indexValues)
      } 
    }
    return indexValues1
}
}


var incorrectArray = []
var indexValues = []
var button = document.getElementById("guess-button")
var word = secretWord()
button.addEventListener('click', function(){
  var letter = document.querySelector("input").value
  var incorrectArray = incorrectArray.concat(incorrect(word, letter, incorrectArray))
  var indexValues = indexValues.concat(correct(word, letter, indexValues))

})
