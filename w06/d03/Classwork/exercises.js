
/////// Positive Negative Exercise: ///////// 

part 1
function number(num1, num2) {
	if (num1 > 0 || num2 > 0)  
		{ console.log("true"); 
		}
	else
		{ console.log("false");
	};
};
number (1, -1)
number (-1, 1)
number (-4, -5)


part 2
function number(num1, num2, condition){
	var product = num1 * num2;

	if (product < 0 && condition == false){
		return true
	} else if (num1 < 0 && num2 < 0 && condition == true  ) {
		return true
	} else {
		return false
	};
};
number(1, -1, false)
number(1, 1, false)
number(1, 1, true)
number(-3, -1, true)

/////// Count xx Exercise ///////// 
  count_xx("abcxx")
  // 1
  count_xx("xxx")
  // 2
  count_xx("xxxx")
  // 3

function count_xx(str) {
	var i = 0
	var count = 0
	while (i<str.length) {

		if (str.charAt(i) == "x" && str.charAt(i+1) == "x") {
			count +=1
		}

		i+=1;
	}
	return count;
}
console.log(count_xx("abcxx"));
console.log(count_xx("xxx"));
console.log(count_xx("xxxx"));



/////// Sum 10 /////////
Given 2 integers, return true if one if them is 10 or if their sum is 10.

function makes10(num1, num2) {
if (num1 == 10 || num2 == 10)
	{ console.log ("true");
	}
else if (num1 + num2 == 10) 
	{ console.log ("true");
	}
else 
	console.log ("false");
};

makes10(9, 10)
makes10(9, 9)
makes10(1, 9)


/////// String Without End /////////
Given a string, return a version without the first and last char, so "Hello" yields "ell". The given string length should be at least 2.

function withoutEnd (string) {
	string = string.slice(1, -1)
	return string
};

console.log(withoutEnd('Hello'));
console.log(withoutEnd('java'));
console.log(withoutEnd('coding'));


/////// Make Tags/////////
The web is built with HTML strings like "Yay" which draws Yay as italic text. In this example, the "i" tag makes and which surround the word "Yay". Given tag and word strings, create the HTML string with tags around the word, e.g. "Yay".

function makeTags(tag, str)
return ("<"+tag+">"+text+"<"+tag+">"); 
console.log(makeTags('i', 'Yay'));
console.log(makeTags('i', 'Hello'));
console.log(makeTags('cite', 'Yay'));


///////  Define a function maxOfThree ///////// 
Define a function maxOfThree that takes three numbers as arguments and returns the largest of them

function var maxOfThree(x, y, z) {
 console.log(Math.max(x,y,z));
};
	
maxOfThree(1,4,6)


/////// takes 2 numbers and prints ///////// 
Write a command line app that takes 2 numbers and prints every number in between

// ["node", "filename", "2", "6"]
var args = process.argv 

function number(x,y) {
  var i = 1;
  while(i < y - x) {
    console.log(x+i)
    i = i + 1;
  }
}
// [2][3] arguments in the array
number(parseInt(args[2]),parseInt(args[3]));


///////filterLongWords/////////
Write a function filterLongWords that takes an array of words and an integer i and returns the array of words that are longer than i.

function filterLongWords(int, array) {
list = []

//for loop  
   //starting pt.  // ending pt. // increments of +1   
for(var i = 0; i < array.length; i++) { 

if (array[i].length > int) {
list.push(array[i]);
}
}
console.log(list);
}

filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])


/////// Define a function initials /////////
// Take a person's name as input and returns their initials.
// Use loops for this instead of an enumerator like map.
// It should worked both with and without a middle name being provided.

function initials (str){
	var name = str.split(" ");
	list = []
	for (var i = 0; i < str.length; i++){
	list.push(array[i][0]);	
	}
	}
	console.log(list)	
initials('Neel Jayendra Patel');

/////// randomly chosen ///////// 
Write a command line app that returns a name randomly chosen from the cast of friends
$ cast
# Jennifer Anniston
$ cast
# Mathew Perry

var array = ["Chandler", "Monica", "Ross", "Joey"];    
var rand = array[Math.floor(Math.random() * array.length)];

console.log(rand)