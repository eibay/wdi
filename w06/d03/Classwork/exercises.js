var posNeg = function(num1, num2)  { 
if (num1 < 0) {
  var num1 = "negative";
} else {
  var num1 = "positive";
};

if (num2 < 0) {
  var num2 = "negative";
} else {
  var num2 = "positive";
};

if ((num2 == "positive" && num1 == "negative") ||  (num2 == "negative" && num1 == "positive")){
console.log("true");
} else {
console.log("false");

};
};

// section 2
var posNeg = function(num1, num2, statement)  { 
if (num1 < 0) {
  var num1 = "negative"
} else {
  var num1 = "positive"
};

if (num2 < 0) {
  var num2 = "negative"
} else {
  var num2 = "positive"
};

if ((num2 == "positive" && num1 == "negative") ||  (num2 == "negative" && num1 == "positive")){
  console.log("true")
} else if (num1 == "negative" && num2 == "negative" && statement == true){
  console.log("true")

} else {
console.log("false")

};
};

function count(string) {
 var countxx = string.match(/xx/g)
 // var sets locally 
 return countxx.length
};


function ten(num1, num2){
if (num1 == 10 || num2 == 10 || (num1 + num2 == 10)){
return true
}else{
  return false
};
};
// for every conditional in js use { and end with };

function word(str){
var answer = str.slice(1, str.length-1)
// takes word between here
console.log(answer)

};


function tagged(tag, word){
var taggingbeginning = "<" + tag + ">"
var taggingend = "</" + tag + ">"
var wordtag = taggingbeginning + word + taggingend
console.log(wordtag)
};

function maxnum(num1, num2, num3){
  var maxnumber = Math.max(num1, num2, num3) 
  console.log(maxnumber)
};

function between(num1, num2) {
var i = 1
while (i < num2-1 ) {
  console.log(num1+i)
  i += 1

}};


function longwords(num, array){
  var i = 0
  while (i < array.length){
    if (array[i].length > num){
      console.log(array[i])
  }
  i += 1
}
}


function initials(name){
var arrayname = name.split(" ")
var i = 0
var letters = []
while (i < arrayname.length){  
   letters.push(arrayname[i].charAt(0))
   i += 1
 }
 console.log(letters.join(''))
}


// # Math.floor(Math.random() * (max - min +1)) + min
//doesnt include max number

// Math.random does 0-1 so this is how we fix
//becuase random doesnt include max so no -1 so to include max VARMAX

array = ["Rachel", "Joey", "Chandler", "Phoebe", "Monica", "Ross"]
index = Math.floor(Math.random() * array.length)
var name = array[index]
console.log(name)




