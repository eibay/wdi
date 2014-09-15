var http = require('http');

var characters = [
	{name: "Fred Flinstone", id: "1"},
	{name: "Barey Rumble", id: "2"},
	{name: "Steve Rogers", id: "3"},
	{name: "Bruce Wayne",  id: "4"},
	{name: "Frodo", id: "5"},
	{name: "Homer Simpson", id: "6"}
]

var names = ["alice", "bob", "carol", "dan", "errol", "francis", "gary", "Jack"]





var server = http.createServer(function(request, response) {
	var JSON_characters = JSON.stringify(characters);

	var path = request["url"];
	var method = request["method"];



	
	var dynamicPath = path.split("/")[2]
 // assign user if there are two / in path, then we can assume it is a dynamicPath



	if((path=="/user/create") && (method=="POST")) {
		var newCharHash = {}
		var randomIndex = Math.floor(Math.random() * ((names.length) - (names.length - 6)))
		newCharHash["name"] = names[randomIndex]

		var newCharId = characters[characters.length - 1]["id"]
		newCharHash["id"] = parseInt(newCharId) + 1	//remember to parse to integer

		characters.push(newCharHash)

		response.end(JSON.stringify(newCharHash))
	}

	else if(path == "/user/" + dynamicPath) { //dynamic paths
		characters.forEach(function(character) { 
			if(character["id"]==dynamicPath) {
				response.end(JSON.stringify(character))
			}
		})	
	}
	//this goes first because otherwise it takes the pagelength one.
	else if(path=="/users") { 
		response.end(JSON.stringify(characters))
	}
	else if(path.split("?")[0] == "/users") { // this is to avoid Type Error: cannot call .split of undefined
		var pageLength = parseInt(path.split("?")[1].split("=")[1].split("&")[0])
		var pageNum = parseInt(path.split("=")[2])
		var output = []
		for(i=pageLength*pageNum-pageLength-1; i< pageLength * pageNum; i++) {
			output.push(characters[i])
		}
		response.end(JSON.stringify(output))
	}



})
server.listen(2000)