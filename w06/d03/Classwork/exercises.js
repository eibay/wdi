// 1. Positive Negative
// Given 2 integers, return true if one is negative and one is positive.

  		
//  function posNeg(num1, num2){
// 	var product = num1 * num2;

// 	if (product < 0){
// 		return true
// 	} 	else {
// 		return false
// 	};
// };


// var truefalse = function(one, two) {
// 	console.log(one, two);
// };

// 	if ( one < 0 && two > 0){
// 		console.log("true");
// 	} else if (one < 0 && two < 0) {
// 		console.log("false");
// 	} else {
// 		console.log("false");
// 	};

// Enhancement: Given 2 integers, return true if one is negative and one is positive except if the third argument is true, 
// then return true only if both are negative.

// function posNeg(num1, num2, condition){
// 	var product = num1 * num2;

// 	if (product < 0 && condition == false){
// 		return true
// 	}	else if (num1 < 0 && num2 < 0 && condition == true ) {
// 		return true
// 	}	else {
// 		return false
// 	};
// };

// posNeg(1, -1, false)
// // true
// posNeg(1, 1, false)
// // false
// posNeg(1, 1, true)
// // false
// posNeg(-3, -1, true)
// //true

// 2. Count xx
// Count the number of "xx" in the given string. We'll say that overlapping is allowed, so "xxx" contains 2 "xx".

// function count_xx(string) {
// 	var i = 0;

// 	var john = 0;
// 	while (i<string.length-1) {
// 		if (string.charAt(i) == 'x' && string.charAt(i+1) == 'x') {
// 			john += 1;
// 		}

// 		i+=1;
// 	}

// 	return john;
// }

// count_xx("abcxx")
// // 1
// count_xx("xxx")
// // 2
// count_xx("xxxx")
// // 3

// 3. Sum 10
// Given 2 integers, return true if one if them is 10 or if their sum is 10.

// function makes10(n, n1){
// 	var product = n + n1;

// 	if (product == 10){
// 		console.log(true);
// 	}	else if (n == 10) {	
// 		console.log(true);
// 	}	else if (n1 == 10) {		
// 		console.log(true);
// 	}	else {
// 		console.log(false);
// 	};
// };

// makes10(9, 10)
// // true
// makes10(9, 9)
// // false
// makes10(1, 9)
// // true

// 4. String Without End
// Given a string, return a version without the first and last char, so "Hello" yields "ell". The given string length should be at least 2.


// function withoutEnd(string) {
// 	var i = 0;

// 	var chopped = "";
// 	while (i < string.length) {
// 		if (i == 0 || i == string.length - 1)  {
		
// 		} else {
// 			console.log(chopped = chopped + string[i])
// 		}

// 		i = i + 1
// 	};
// };


// withoutEnd('Hello')
// // 'ell'
// withoutEnd('java')
// // 'av'
// withoutEnd('coding')
// // 'odin'

// // return str.slice(1,-1)


// 5. Make Tags
// The web is built with HTML strings like "Yay" which draws Yay as italic text. 
// In this example, the "i" tag makes <i> and </i> which surround the word "Yay" -> <i>Yay</i>. 
// Given tag and word strings, create the HTML string with tags around the word, e.g. "Yay".

// function makeTags(one, two) {
// 	console.log('<' + one + '>' + two + '</' + one + '>')
// };

// makeTags('i', 'Yay')
// // '<i>Yay</i>'
// makeTags('i', 'Hello')
// // '<i>Hello</i>'
// makeTags('cite', 'Yay')
// // '<cite>Yay</cite>'

// 6. Define a function maxOfThree that takes three numbers as arguments and returns the largest of them

// function maxOfThree(one, two, three) {
// 	largest = Math.max(one, two, three);
// 	console.log(largest);	
// };

// maxOfThree(1, 4, 6)
// //6


// 7. Write a command line app that takes 2 numbers and prints every number in between

// function inBetween(1, 2) {
// 	var i = 1;
// 	while(i < y - x) {
// 		console.log(x+i)
// 		i = i + 1;
// 	};
// };

// $ inbetween 2 6
// // 3
// // 4
// // 5

// 8. Write a function filterLongWords that takes an array of words and an integer i and returns the array of words that are longer than i.

// function filterLongWords(int, array) {
// 	var i = 0;

// 	var longerthani = [];
// 	while(i < array.length) {
// 		if(array[i].length > int) {
// 		longerthani.push(array[i]);
// 		}

// 		i = i+1;
// 	};
// 	console.log(longerthani);
// };

// filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])
// ["hello", "hola", "aloha"]

// 9. Define a function initials that takes a person's name as input and returns their initials.
// Use loops for this instead of an enumerator like map.
// It should worked both with and without a middle name being provided.

function initials(name) {
	var i = 0;

	var initials = [];
	var names = name.split(" ")
	

	initials = initials.join(" ")

}
initials('Neel Jayendra Patel');
// NJP

#10. Write a command line app that returns a name randomly chosen from the cast of friends

$ cast
# Jennifer Anniston
$ cast
# Mathew Perry