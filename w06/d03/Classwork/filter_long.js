// Write a function filterLongWords that 
// takes an array of words and an integer i 
// and returns the array of words that are longer than i.

// filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])
// // ["hello", "hola", "aloha"]

function filterLongWords( minChar, wordsArray ){
	var newArray = []
	for (var i = 0; i < wordsArray.length; i++) {
		if (wordsArray[i].length > minChar) {
			newArray.push(wordsArray[i]) 
		} 
	}
// for (var i = 0; i < arrayLength; i++) {
//     alert(myStringArray[i]);
//     //Do something
// }

 	return newArray;

}



console.log(filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"]));


// var array = [];
// var word1 = args[2];
// var word2 = args[3];
// var word3 = args[4];
// var word4 = args[5];
// var word5 = args[6];


// function filterLongWords(words) {
// 	array[array.length] = word1;
// 	array[array.length] = word2;
// 	array[array.length] = word3;
// 	array[array.length] = word4;
// 	array[array.length] = word5;

// 	console.log(array);




// };





