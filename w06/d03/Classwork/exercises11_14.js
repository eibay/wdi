#! /usr/local/bin/node

// exercise 11 - 1
firstnamelist = ["Bumblebee", "Banderscoop", "Broccoli", "Rinkydink", "Bombadil", "Boilerduck", "Bandicoot", "Fragglerock", "Muffinmitts", "Crumplesack", "Congleton", "Blubberbrains", "Buffalo", "Benadryl", "Butterfree", "Burberry", "Whippersnatch", "Buttermilk", "Beezlebub", "Budapest", "Boilerdang", "Blubberwhale", "Bumberstump", "Bulbasaur", "Cogglesnatch", "Liverswort", "Bodybuild", "Johnnycash", "Burgerking", "Bonaparte", "Bunsenburner", "Billiardball", "Baseballmitt", "Blubberbett", "Baseballbat", "Rumblesack", "Barister", "Danglerack", "Rinkydink", "Bombadil", "Honkytonk", "Billyray", "Bumbleshack", "Snorkeldink", "Anglerfish", "Beetlejuice", "Bedlington", "Bandicoot", "Boobytrap", "Bentobox", "Pallettown", "Wimbledon", "Hairyhog", "Buttercup", "Blasphemy", "Syphilis", "Snorkeldink", "Brandenburg", "Barbituate", "Snozzlebert", "Tiddleywomp", "Bouillabaisse", "Wellington", "Benetton", "Bendandsnap", "Timothy", "Brewery", "Bentobox", "Brandybuck"];

  lastnamelist = ["Coddleswort", "Curdlesnoot", "Calldispatch", "Humperdinck", "Rivendell", "Cuttlefish", "Lingerie", "Vegemite", "Ampersand", "Cumberbund", "Candycrush", "Clombyclomp", "Cragglethatch", "Nottinghill", "Cabbagepatch", "Camouflage","Creamsicle", "Curdlemilk", "Upperclass", "Frumblesnatch", "Crumplehorn", "Talisman", "Candlestick", "Chesterfield", "Bumbersplat", "Scratchnsniff", "Snugglesnatch", "Charizard", "Carrotstick", "Cumbertoot", "Crackerknack", "Crucifix", "Cuckatoo", "Crackletot", "Collywog", "Gigglesnort", "Capncrunch", "Covergirl", "Cumbersnatch", "Countryside","Coggleswort", "Splishnsplash", "Copperwire", "Animorph", "Curdledmilk", "Cheddarcheese", "Cottagecheese", "Crumplehorn", "Snickersbar", "Banglesnatch", "Stinkyrash", "Camelhump", "Chickenbroth", "Concubine", "Candygram", "Moldyspore", "Chuckecheese", "Cankersore", "Crimpysnitch", "Wafflesmack", "Chowderpants", "Toodlesnoot", "Clavichord", "Cuckooclock", "Oxfordshire", "Cumbersome", "Chickenstrips", "Battleship", "Commonwealth", "Cunningsnatch", "Custardbath", "Kryptonite"]

// exercise 11 - 1

bee = firstnamelist.indexOf("Bumblebee");
console.log(firstnamelist[bee])

// exercise 11 - 2
firstnamelist.push("Peter");

// exercise 11 - 3
index = firstnamelist.indexOf("Muffinmitts");
firstnamelist.splice( index, 1);

// exercise 11 - 4
index = lastnamelist.indexOf("Scratchnsniff")

// exercise 11 - 5
first = firstnamelist[Math.floor(Math.random() * firstnamelist.length)];

last = lastnamelist[Math.floor(Math.random() * firstnamelist.length)];

console.log(first + " " + last);

var args = process.argv;

// exercise 11 - 6
function makeName(list1, list2, num) {
	for (var i = 1; i <= num; i++) {
		first = firstnamelist[Math.floor(Math.random() * firstnamelist.length)];
		last = lastnamelist[Math.floor(Math.random() * firstnamelist.length)];
		console.log(first + " " + last);
	}
}

makeName(firstnamelist, lastnamelist, args[2]);

 /// exercise 12

function concat(args) {
	var string = "";
	for (var i = 0; i < args.length; i++) {
		string = string + args[i];
	}
	console.log(string);
}

//concat(args)


 /// exercise 13
var fs = require('fs')

function concat(file1, file2) {
	var string = [];
	var string1 = fs.readFileSync(file1, 'utf8')
		string.push(string1);
	var string2 = fs.readFileSync(file2, 'utf8')
		string.push(string2);
	console.log(string.join(" "))
}

// concat(args[2], args[3])

/// exercise 14

function mobycount(word) {
	var moby = fs.readFileSync('./MobyDick.txt', 'utf8');
	moby = moby.split(word)
	console.log(moby.length)
}
debugger
// function mobycount(word) {
// 	var string = fs.readFileSync('./MobyDick.txt', 'utf8');
// 	console.log(string.match(new RegExp( "\\b" + args[2] + "\\b", "gi")).length)
// }

mobycount(args[2])

