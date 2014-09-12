var fs = require('fs');
var http = require('http');
var request = require('request'); 
var Mustache = require('mustache');

var instAPIKey = "17a4630338cd4da38b94cbbecd787fae";
var friendsArray = [
	"Jennifer Aniston", 
	   "Courteney Cox", 
	     "Lisa Kudrow", 
	    "Matt LeBlanc"
	]

// define a function called moreAdvancedThings 
// it takes a filename & returns a fidget, frankly  
function moreAdvancedThings(fileName){
	var fileBuffer = fs.readFileSync(fileName);
	return fileBuffer.toString(); 
}

// my world-famous randomIndex function 
Array.prototype.randomIndex = function(){
	var randomFloatingIndex = Math.random() * this.length; 
	var randomIndex = Math.floor(randomFloatingIndex); 
	return randomIndex
}

	// using C comments to indicate serious-mindedness 
	/* SERVER */
	var server = http.createServer(function(request, response){
	var path = request.url; 

	if(path == '/') {
		var indexHTML = moreAdvancedThings("views/index.html");
		response.end(indexHTML); 
	} else if(path == "/cast") {
		var locals = {
			friends: friendsArray 
		}
		var mustacheTemplate = moreAdvancedThings("views/friends.html"); 
		var view = Mustache.render(mustacheTemplate, locals); 
		response.end(view); 
	} else if(path == "/cast/random") {
		var locals = {
			friend: friendsArray[friendsArray.randomIndex()]
		}
		var mustacheTemplate = moreAdvancedThings("views/friend.html"); 
		var view = Mustache.render(mustacheTemplate, locals); 
		response.end(view); 
	} else {
		response.end("<h1>Hello Lost Person!</h1><p>404 404 404 404 404 404 404</p>");	
	}
});

server.listen(2000); 