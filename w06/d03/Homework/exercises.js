var firstnamelist = ["Bumblebee", "Banderscoop", "Broccoli", "Rinkydink", "Bombadil", "Boilerduck", "Bandicoot", "Fragglerock", "Muffinmitts", "Crumplesack", "Congleton", "Blubberbrains", "Buffalo", "Benadryl", "Butterfree", "Burberry", "Whippersnatch", "Buttermilk", "Beezlebub", "Budapest", "Boilerdang", "Blubberwhale", "Bumberstump", "Bulbasaur", "Cogglesnatch", "Liverswort", "Bodybuild", "Johnnycash", "Burgerking", "Bonaparte", "Bunsenburner", "Billiardball", "Baseballmitt", "Blubberbett", "Baseballbat", "Rumblesack", "Barister", "Danglerack", "Rinkydink", "Bombadil", "Honkytonk", "Billyray", "Bumbleshack", "Snorkeldink", "Anglerfish", "Beetlejuice", "Bedlington", "Bandicoot", "Boobytrap", "Bentobox", "Pallettown", "Wimbledon", "Hairyhog", "Buttercup", "Blasphemy", "Syphilis", "Snorkeldink", "Brandenburg", "Barbituate", "Snozzlebert", "Tiddleywomp", "Bouillabaisse", "Wellington", "Benetton", "Bendandsnap", "Timothy", "Brewery", "Bentobox", "Brandybuck"];

lastnamelist = ["Coddleswort", "Curdlesnoot", "Calldispatch", "Humperdinck", "Rivendell", "Cuttlefish", "Lingerie", "Vegemite", "Ampersand", "Cumberbund", "Candycrush", "Clombyclomp", "Cragglethatch", "Nottinghill", "Cabbagepatch", "Camouflage","Creamsicle", "Curdlemilk", "Upperclass", "Frumblesnatch", "Crumplehorn", "Talisman", "Candlestick", "Chesterfield", "Bumbersplat", "Scratchnsniff", "Snugglesnatch", "Charizard", "Carrotstick", "Cumbertoot", "Crackerknack", "Crucifix", "Cuckatoo", "Crackletot", "Collywog", "Gigglesnort", "Capncrunch", "Covergirl", "Cumbersnatch", "Countryside","Coggleswort", "Splishnsplash", "Copperwire", "Animorph", "Curdledmilk", "Cheddarcheese", "Cottagecheese", "Crumplehorn", "Snickersbar", "Banglesnatch", "Stinkyrash", "Camelhump", "Chickenbroth", "Concubine", "Candygram", "Moldyspore", "Chuckecheese", "Cankersore", "Crimpysnitch", "Wafflesmack", "Chowderpants", "Toodlesnoot", "Clavichord", "Cuckooclock", "Oxfordshire", "Cumbersome", "Chickenstrips", "Battleship", "Commonwealth", "Cunningsnatch", "Custardbath", "Kryptonite"]


// Retrieve "Bumblebee" from the firstname list
var firstname= firstnamelist.indexOf("Bumblebee");
console.log(firstnamelist[firstname]);

// Add "Peter" to the firstnamelist
firstnamelist.push("Peter")
console.log(firstnamelist);

// Remove "Muffinmitts" from the firstnamelist
delete firstnamelist[8];
console.log(firstnamelist);

// Find out the index of "Scratchnsniff" in lastnamelist
var lastname= lastnamelist.indexOf("Scratchnsniff");
console.log(lastnamelist[lastname];

// Combine 1 randomly selected name from firstnamelist and 1 randomly selected name from lastnamelist to form a name.
// var firstnamerandom = firstnamelist[Math.floor(Math.random() * nofirstnamelist.length)];

var lastnamerandom = lastnamelist[Math.floor(Math.random() * lastnamelist.length)];	

console.log((firstnamerandom) +" "+ (lastnamerandom));

// Write a command line app that takes as arguments any number of words and prints out the concatenation of them (you may have to google concatenation)
var args = process.argv.slice(2);
console.log(args.join(''));
// node exercises.js hello big world

// Bonus Write the same concatenation program as in #12 except that the arguments are files. Print out the concatenation of the content of these files. Can you figure out how to redirect the output of your program to a file from the command line (consult docs for file operations in JS)

var fs = require("fs");
var content= fs.readFileSync("../homework/sample.txt");
	console.log(""+ content);




