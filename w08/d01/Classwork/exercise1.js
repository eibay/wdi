// 1. write a function ```makeArray``` that takes 2 words as parameters and returns an array of those 2 words

var makeArray = function(firstword, secondword){
	array = [];
	array.push(firstword);
	array.push(secondword);
	console.log(array);
};

makeArray("hello", "world")