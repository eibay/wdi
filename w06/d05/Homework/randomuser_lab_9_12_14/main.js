var http = require('http');
var fs = require('fs')

var redshirts = {};
redshirts['ffname'] = ["Catherine", "Roxie", "Celeste", "Jessica", "Karen", "Maria", "Judie", "Jackie", "Jen", "Rose", "Rebecca", "Tina", "Peg", "Natalia", "Candice"];
redshirts['mfname'] = ["Frank", "Pete", "Edwin", "Ernesto", "Vince", "Robert", "Mohamed", "Lucas", "Hugo", "Zack", "Ethan", "Charlie", "Carlos", "Ulysses", "Mortimer"];
redshirts['lname'] = ["Pagano", "Moler", "Frisell", "Nilsen", "Snipes", "Bazan", "Greer", "Baumgartner", "Stoops", "Wilke", "Mastrangelo", "Spalding", "Block", "Quayle", "Halliday", "Trautman", "Guerro", "Johnson", "Schoonmaker"];
redshirts['nick'] = ["Skinny", "Tex", "Shooter", "Dick", "Ducky", "The Rooster", "Tequila", "The Hammer", "Ace", "Lefty", "Jumbo", "El Gallo", "Buck", "Bullet", "Tubs", "Bones", "Moose", "Stretch", "Peewee", "Bugsy", "The Chin"];
redshirts['hometown'] = ["San Antonio, Texas", "Henderson, Nevada", "Boise, Idaho", "Tulsa, Oklahoma", "Fresno, California", "Chula Vista, California", "Montgomery, Alabama", "Norfolk, Virginia", "Durham, North Carolina", "Lubbock, Texas", "Anchorage, Alaska", "Aurora, Colorado", "Cleveland, Ohio", "Kalamazoo, Michigan", "Fayeteville, West Virginia", "Huntington, New York", "Chesapeake, Virginia", "Columbus, Ohio", "Milwaukee, Wisconsin", "New Orleans, Louisiana", "Newark, New Jersey"];
redshirts['looks'] = ["portly", "foppish", "handsomish", "childish", "lean", "stout", "slender", "athletic", "suave", "awkward", "ruffled", "dapper", "dashing", "posh", "spiffy", "classy", "debonaire", "smart", "drab", "dandified", "mod", "upscale", "worn", "old-fashioned", "flabby", "worldly", "polished", "unrefined", "unsophisticated", "plain", "folksy", "wiry", "wispy", "svelte", "lanky", "fat", "rotund", "feeble", "doddering", "paltry", "sloppy", "lax", "taut", "droopy"];
redshirts['attitude'] = ["cool", "cocky", "arrogant", "refreshing", "affable", "gunshy", "surly", "angry", "remorseful", "edgy", "callous", "vain", "ambitious", "sincere", "reliable", "candid", "motivated", "cold", "pretentious", "ego-centric", "selfish", "jovial", "quizzical", "confident", "condescending", "courteous", "modest", "reliable", "sarcastic", "tenacious", "honest"];
redshirts['last_words'] = ["Mein Leben!", "My only regret is that i have bonitis.", "Tell my wife I love him", "I picked the wrong week to stop sniffing glue.", "Either I'm dead or my watch has stopped.", "They couldn't hit an elephant at this distance!", "AAAAAAAAAAGH!", "It's just a flesh wound.", "How rude!"];

var rando = function(redshirts) {
	character = []
	var gender = [0, 1]
	gender = gender[Math.floor(Math.random() * gender.length)];
		if (gender == 1) {
			var firstname = redshirts['ffname'][Math.floor(Math.random() * redshirts['ffname'].length)]	
		} else {
			var firstname = redshirts['mfname'][Math.floor(Math.random() * redshirts['mfname'].length)]
		} 
		var lastname = redshirts['lname'][Math.floor(Math.random() * redshirts['lname'].length)]
		var nickname = redshirts['nick'][Math.floor(Math.random() * redshirts['nick'].length)]
		var hometown = redshirts['hometown'][Math.floor(Math.random() * redshirts['hometown'].length)]
		var style = redshirts['looks'][Math.floor(Math.random() * redshirts['looks'].length)]
		var xattitude = redshirts['attitude'][Math.floor(Math.random() * redshirts['attitude'].length)]
		var lwords = redshirts['last_words'][Math.floor(Math.random() * redshirts['last_words'].length)]
		character.push({fname: firstname}, {lname: lastname}, {nname: nickname}, {town: hometown}, {looks: style}, {attitude: xattitude}, {last_words: lwords})
	return character
}

var server = http.createServer(function(req, res){
  var path = req["url"]
  var dir = path.split("/")[1]
  var basename = path.split("/")[2]
  console.log("the client requested " + path)
 
  if (path == "/") {
  res.end(JSON.stringify(rando(redshirts)))
	} else if (path.split("/").length == 2) {
		console.log(dir)
		for (var i=0; i<redshirts.length; i++) {
			if (dir == redshirts[i]["gender"]) {
				res.end(JSON.stringify(redshirts[i]))
			}
		}
	}
});

server.listen(2000);