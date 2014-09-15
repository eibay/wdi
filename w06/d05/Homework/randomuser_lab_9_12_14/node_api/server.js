var http = require('http');
var redis = require('node-redis'); 
var url = require('url'); 
var fs = require('fs');

// data to randomize 

var randomRosencrantzerData = {
	gender: ["male", "female", "transgendered"], 
	title: ["ms", "mr", "mrs", "sir", "dr", "prof"], 
	first_name: ["clayton", "cheryl", "nick", "amanda", 
	  "conor", "eric", "misty", "david", "chris", "heidi", 
   "natassia", "tim", "joe", "jeff", "adrian", "jill", "lisa", 
   	  "trish", "sean", "brenda", "yoshie", "shotaro", "olivia", 
   	  "neel", "janine", "iris", "dan", "crawford"], 
   	last_name: ["kurdi", "laws", "carmona", "biggica", "kramer", 
   	"hastings", "albachten", "dargan-levy", "lin", "ortenberg", 
   	"patel", "martinez", "rosen", "farber", "pitt", "forbes", 
   	"campomanes", "kielley", "williams-foy"]
}

// random functions for Array 

Array.prototype.randomIndex = function(){
	var randomFloatingIndex = Math.random() * this.length; 
	var randomIndex = Math.floor(randomFloatingIndex); 
	return randomIndex
}

Array.prototype.randomValue = function(){
	return this[this.randomIndex()]
}

// random Rosencrantzer functions 


function genUserId(){
	return Math.random().toString(36).substring(7);
}

function genHipChatAvatar(user_id){
	return "http://robohash.org/" + user_id + ".png"
}

function genRandomRosencrantzer(){ 
	var user_id = genUserId();
	return { "gender": randomRosencrantzerData.gender.randomValue(), 
		"title": randomRosencrantzerData.title.randomValue(),
		"first_name": randomRosencrantzerData.first_name.randomValue(),
		"last_name": randomRosencrantzerData.last_name.randomValue(), 
		"user_id": user_id, 
		"hipchat_avatar": genHipChatAvatar(user_id)
	}
}

// how to use redis 

var client = redis.createClient(); 

// SERVER 

var server = http.createServer(function(request, response){
	// for GET /hello?name=cheryl
	var method = request.method; // "GET"
	var url_parts = url.parse(request.url, true);
	var path = url_parts.pathname; // "/hello"
	var query = url_parts.query; // { name: 'cheryl' }

	if(method == "POST"){
		if(path == "/user/create"){
			var randomRosencrantzer = genRandomRosencrantzer(); 
			var randomRosencrantzerJSON = JSON.stringify(randomRosencrantzer);
			client.rpush.apply(client, ['randomRosencrantzers'].concat(randomRosencrantzerJSON));
			response.end(randomRosencrantzerJSON); 
		} else {
			response.end("<h1>404 Not Found</h1>"); 
		}
	} else if(method == "GET"){
		var path_array = path.split('/');
		var user = path_array[1];
		var possible_user_id = path_array[2];
		if(user == "user") {
			client.lrange("randomRosencrantzers", 0, -1, function(error, randomRosencrantzers){
				if (error) { 
					return console.log(error); 
				} else {
					results = randomRosencrantzers.filter(function(randomRosencrantzer){
						return JSON.parse(randomRosencrantzer)["user_id"] == possible_user_id;
					})

					if(results.length == 1) {
						str = results[0];
						response.end(str);
					} else {
						response.end("<h1>404 Not Found</h1>"); 
					}
				}
			})		
		} else if(path == "/users"){
			var pageLength = Number(query.page_length);
			var pageNum = Number(query.page_num);
			if(pageLength){ 
				client.lrange("randomRosencrantzers", 0, -1, function(error, randomRosencrantzers){
					if (error) { 
						return console.log(error); 
					} else {
						randomRosencrantzers = randomRosencrantzers.map(function(randomRosencrantzer){
							return JSON.parse(randomRosencrantzer);
						})
						// pagination logic 
						// Array.prototype.slice(startIndexInclusive, stopIndexExclusive); 

						// 0= (1-1)*5, 5= (2-1)*5 
						var startIndex= (pageNum-1)*pageLength;

						// 5= 0+5, 10= 5+5 
						var stopIndex= startIndex+pageLength;  

						var page = randomRosencrantzers.slice(startIndex, stopIndex); 


						var randomRosencrantzersJSON = JSON.stringify(page); 
						response.end(randomRosencrantzersJSON);
					}
				});
			}
		} else {
			response.end("<h1>404 Not Found</h1>"); 
		}
	} else {
		response.end("<h1>404 Not Found</h1>"); 
	}

}).listen(2000);
