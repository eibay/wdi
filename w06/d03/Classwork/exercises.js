//Part 1

// function trueFalse(one, two) {
// if (one < 0 || two < 0) {
// console.log(true);
// } else if (one < 0 && two < 0) {
// console.log(false);
// } else {
// console.log(false);
// };
// };

/////////////////////////////////

//Part2

// function posNeg(num1, num2) {
// 	var product = num1 * num2;
// 	if (product < 0) {
// 		return true
// 	} else {
// 		return false
// 	}
// };

/////////////////////////////////

//Part3

// function posNeg(num1, num2, condition) {
// 	var product = num1 * num2;
// 	if (product < 0 && condition == true) {
// 		return true;
// 	} else if (num1 < 0 && num2 < 0 && condition == true) {
// 		return true
// 	} else {
// 		return false
// 	}
// };

/////////////////////////////////

//Part4

// function trueFalse(one, two, three) {
// 	if (one < 0 && two < 0 && three == true) {
// 		console.log(true);
// 	} else if (one < 0 || two < 0) {
// 		console.log(true);
// 	} else if (one < 0 && two < 0) {
// 		console.log(false);
// 	} else {
// 		console.log(false);
// 	};
// };

// console.log(trueFalse(3, 4, 1))

/////////////////////////////////

//Part2

// 2. Count xx

//   Count the number of "xx" in the given string. We'll say that overlapping is allowed, so "xxx" contains 2 "xx".

//   ```javascript
//     count_xx("abcxx")
//     // 1
//     count_xx("xxx")
//     // 2
//     count_xx("xxxx")
//     // 3
//   ````

// function count_xx(str) {
// return str.split("xx").length - 1
// };

/////////////////////////////////

//Part3

// function makes10num1, num2) {
// 	var num = num1 + num2;
// 	if (num == 10 || num1 == 10 || num2 == 10) {
// 		return true
// 	} else {
// 		return false
// 	}
// };

// console.log(makes10(9, 2))

/////////////////////////////////

//Part4

// function withoutEnd(str) {
// 	return str.slice(1, str.length)
// };

// console.log(withoutEnd("Hello"))

/////////////////////////////////

// Part5

// function makeTags(one, two) {
// 	return '<' + one + '>' + two + '</' + one + '>'
// };

// console.log(makeTags('i', 'yay'))

/////////////////////////////////

//Part6

// function maxOfThree(num1, num2, num3) {
// 	array =  [num1, num2, num3]
// 	return Math.max.apply(null, array)
// };

// console.log(maxOfThree(100, 4, 9))

/////////////////////////////////

//Part7

// var args = process.argv
// var num1 = args[2]
// var num2 = args[3]

// while (num1<num2-1) {
// 	num1 = parseInt(num1)
// 	num2 = parseInt(num2)
// 	console.log(num1+1)
// 	num1+=1;
// };

// #! /usr/bin/env node



// var args = process.argv
// var fl = require()
// var num1 = parseInt(args[2])
// var num2 = parseInt(args[3])

// function inBetween(num1, num2), ) {
// 	while (num1<num2-1) {
// 		console.log(num1+1)
// 		num1+=1;
// 	};
// };

// inBetween(num1, num2);

/////////////////////////////////

//Part8

// fucntion filterLongWords(num, array) {
// 	while (num < array.length) {
// 		console.log(array[num])
// 		num+=1
// 	};
// };

// console.log(filterLongWords(2, ["hi", "nice", "to", "see", "you"]))

/////////////////////////////////

//Part9

// function initials(str) {
// 	array = str.split(' ')
// 	i = 0
// 	while (i < array.length) {
// 		console.log(array[i].charAt(0))
// 		i+=1
// 	};
// };

// console.log(initials('Shotaro Kamegai'))

/////////////////////////////////

//Part10

firstnamelist = ["Bumblebee", "Banderscoop", "Broccoli", "Rinkydink", "Bombadil", "Boilerduck", "Bandicoot", "Fragglerock", "Muffinmitts", "Crumplesack", "Congleton", "Blubberbrains", "Buffalo", "Benadryl", "Butterfree", "Burberry", "Whippersnatch", "Buttermilk", "Beezlebub", "Budapest", "Boilerdang", "Blubberwhale", "Bumberstump", "Bulbasaur", "Cogglesnatch", "Liverswort", "Bodybuild", "Johnnycash", "Burgerking", "Bonaparte", "Bunsenburner", "Billiardball", "Baseballmitt", "Blubberbett", "Baseballbat", "Rumblesack", "Barister", "Danglerack", "Rinkydink", "Bombadil", "Honkytonk", "Billyray", "Bumbleshack", "Snorkeldink", "Anglerfish", "Beetlejuice", "Bedlington", "Bandicoot", "Boobytrap", "Bentobox", "Pallettown", "Wimbledon", "Hairyhog", "Buttercup", "Blasphemy", "Syphilis", "Snorkeldink", "Brandenburg", "Barbituate", "Snozzlebert", "Tiddleywomp", "Bouillabaisse", "Wellington", "Benetton", "Bendandsnap", "Timothy", "Brewery", "Bentobox", "Brandybuck"];

lastnamelist = ["Coddleswort", "Curdlesnoot", "Calldispatch", "Humperdinck", "Rivendell", "Cuttlefish", "Lingerie", "Vegemite", "Ampersand", "Cumberbund", "Candycrush", "Clombyclomp", "Cragglethatch", "Nottinghill", "Cabbagepatch", "Camouflage","Creamsicle", "Curdlemilk", "Upperclass", "Frumblesnatch", "Crumplehorn", "Talisman", "Candlestick", "Chesterfield", "Bumbersplat", "Scratchnsniff", "Snugglesnatch", "Charizard", "Carrotstick", "Cumbertoot", "Crackerknack", "Crucifix", "Cuckatoo", "Crackletot", "Collywog", "Gigglesnort", "Capncrunch", "Covergirl", "Cumbersnatch", "Countryside","Coggleswort", "Splishnsplash", "Copperwire", "Animorph", "Curdledmilk", "Cheddarcheese", "Cottagecheese", "Crumplehorn", "Snickersbar", "Banglesnatch", "Stinkyrash", "Camelhump", "Chickenbroth", "Concubine", "Candygram", "Moldyspore", "Chuckecheese", "Cankersore", "Crimpysnitch", "Wafflesmack", "Chowderpants", "Toodlesnoot", "Clavichord", "Cuckooclock", "Oxfordshire", "Cumbersome", "Chickenstrips", "Battleship", "Commonwealth", "Cunningsnatch", "Custardbath", "Kryptonite"]

//i
firstname[0]

//ii
firstname.unshift("Peter")

//iii

for(i=0; i<firstnamelist.length; i++){
    if(firstnamelist[i] == "Muffinmitts"){
        firstnamelist.splice(i, 1);
    };
};
























