// 1.

// function tellJoke(){
// 	console.log("yo manana");
// };

// tellJoke()

// 2.

// function hello(name){
// 	console.log('Hello ' + name);
// }

// hello('mama')

// 3. 

// 4.

// var names = ["jim", "joe", "mama"]

// function outputNames(array){
// 	for(i = 0; i < array.length; i++){
// 		names.each do |name|
// 	};

// };

// outputNames(names);

// 5.

// function double(number){
// 	console.log(number * 2);
// };

// return double(9999);

// 6.

// function double(number){
// 	return number * 2;
// };

// function quadruple(number){
// 	return (double(number) + double(number));
// };

// console.log(quadruple(4)); 

// 7.

var hash = {
	"jim": "red",
	"joe": "blue",
	"mama": "green"
}

function favColors(){
	for(var value in hash){
		console.log(value + "'s favorite color is " + hash[value]);
	}
}

favColors(hash);

// 8.

// hash_one ={
// 	"peanut": "butter",
// 	"and": "jelly",
// 	"jelly": "yummy"
// }

// hash_two = {
// 	"mmm": "dat",
// 	"jelly": "with",
// 	"peanut": "butter"
// }

// function pbj(one, two){
// 	var combine_hashes = {}
// 	for (var attrname in one) { combine_hashes[attrname] = one[attrname]; }
// 	for (var attrname in two) { combine_hashes[attrname] = two[attrname]; }
// 	console.log(combine_hashes)
// }

// pbj(hash_one, hash_two)



