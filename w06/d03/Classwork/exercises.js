//Part 1

var posNeg = function(x, y) {

	if (x < 0 && y > 0) {
		return true;
	} else if (x > 0 && y < 0){
		return true;
	} else{
		return false;
	};

};



var posNeg = function(x, y, boolean) {

	if (x < 0 && y > 0 && boolean == false) {
		return true;
	} else if (x > 0 && y < 0 && boolean == false){
		return true;
	} else if (x < 0 && y < 0 && boolean == true){
		return true;
	} else {
		return false;
	};

};


//PART 2

var count_xx = function(string){
	
	var i = 0;
	var count = 0;

	while (i < string.length - 1) {
		if (string.charAt(i) == 'x' && string.charAt(i + 1) == 'x'){
			count += 1;
		};
		
		i += 1;

	};
	return count;
};




//PART 3

var makes10 = function(num1, num2){

	if (num1 == 10) {
		return true;
	} else if (num2 == 10){
		return true;
	} else if (num1 + num2 == 10){
		return true;
	} else{
		return false;
	};

};

//PART 4

var withoutEnd = function(string){

	var i = 1;
	var new_string = ""
	if (string.length > 2){
		while (i < string.length - 1){
			new_string += string[i];
			i += 1;
		};
		return new_string;
	}
	else{
		return 'not enough characters'
	};
};

//PART 5

var makeTags = function(tag, word){

	var open_tag = '<' + tag + '>';
	var close_tag = '</' + tag + '>';
	return open_tag + word + close_tag;

};

//PART 6

var maxOfThree = function(num1, num2, num3){
	if (num1 > num2){
		if (num1 > num3){
			return num1
		}else{
			return num3
		};
	}else if (num2 > num3){
		return num2
	}else{
		return num3
	};

};


//PART 7 command line


var inBetween = function(num1, num2){

	for (var i = 1; i < num2; i++){
		console.log(num1 + i)
	};

};



//PART 8 

 var filterLongWords = function(num, array){

 	for(var i = 0; i <= array.length-1; i++){
 		if(array[i].length >= num){
 			console.log(array[i])
 		};
 	};
 	
 };


//PART 9

var initials = function(string){

	var names = string.split(' ');
	var initials = "";

	for (var i = 0; i <= names.length -1; i++){
		initials += names[i][0];
	};

	console.log(initials);
};

//PART 10



var cast = function(array){
	
	var random = array[Math.floor(Math.random() * array.length)];
	
	return random
};

friends=["Jennifer Aniston", "Courteney Cox", "Lisa Kudrow", "Matt LeBlanc", "Matthew Perry", "David Schwimmer"];

cast(friends);



// PART 11


firstnamelist = ["Bumblebee", "Banderscoop", "Broccoli", "Rinkydink", "Bombadil", "Boilerduck", "Bandicoot", "Fragglerock", "Muffinmitts", "Crumplesack", "Congleton", "Blubberbrains", "Buffalo", "Benadryl", "Butterfree", "Burberry", "Whippersnatch", "Buttermilk", "Beezlebub", "Budapest", "Boilerdang", "Blubberwhale", "Bumberstump", "Bulbasaur", "Cogglesnatch", "Liverswort", "Bodybuild", "Johnnycash", "Burgerking", "Bonaparte", "Bunsenburner", "Billiardball", "Baseballmitt", "Blubberbett", "Baseballbat", "Rumblesack", "Barister", "Danglerack", "Rinkydink", "Bombadil", "Honkytonk", "Billyray", "Bumbleshack", "Snorkeldink", "Anglerfish", "Beetlejuice", "Bedlington", "Bandicoot", "Boobytrap", "Bentobox", "Pallettown", "Wimbledon", "Hairyhog", "Buttercup", "Blasphemy", "Syphilis", "Snorkeldink", "Brandenburg", "Barbituate", "Snozzlebert", "Tiddleywomp", "Bouillabaisse", "Wellington", "Benetton", "Bendandsnap", "Timothy", "Brewery", "Bentobox", "Brandybuck"];

lastnamelist = ["Coddleswort", "Curdlesnoot", "Calldispatch", "Humperdinck", "Rivendell", "Cuttlefish", "Lingerie", "Vegemite", "Ampersand", "Cumberbund", "Candycrush", "Clombyclomp", "Cragglethatch", "Nottinghill", "Cabbagepatch", "Camouflage","Creamsicle", "Curdlemilk", "Upperclass", "Frumblesnatch", "Crumplehorn", "Talisman", "Candlestick", "Chesterfield", "Bumbersplat", "Scratchnsniff", "Snugglesnatch", "Charizard", "Carrotstick", "Cumbertoot", "Crackerknack", "Crucifix", "Cuckatoo", "Crackletot", "Collywog", "Gigglesnort", "Capncrunch", "Covergirl", "Cumbersnatch", "Countryside","Coggleswort", "Splishnsplash", "Copperwire", "Animorph", "Curdledmilk", "Cheddarcheese", "Cottagecheese", "Crumplehorn", "Snickersbar", "Banglesnatch", "Stinkyrash", "Camelhump", "Chickenbroth", "Concubine", "Candygram", "Moldyspore", "Chuckecheese", "Cankersore", "Crimpysnitch", "Wafflesmack", "Chowderpants", "Toodlesnoot", "Clavichord", "Cuckooclock", "Oxfordshire", "Cumbersome", "Chickenstrips", "Battleship", "Commonwealth", "Cunningsnatch", "Custardbath", "Kryptonite"];

firstnamelist[0];
firstnamelist.push('Peter');
firstnamelist.splice(8, 1);
lastnamelist.indexOf("Scratchnsniff");

var name = function(array){
	
	var random = array[Math.floor(Math.random() * array.length)];
	
	return random
};

var first = name(firstnamelist);
var last = name(lastnamelist);
console.log(first + " " + last);

















