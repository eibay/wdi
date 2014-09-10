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


var count = function(string) {
 var countxx = string.match(/xx/g)
 return countxx.length
};



// for every conditional in js use { and end with };




