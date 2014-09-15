var http = require('http');
var fs = require('fs');
var url = require('url');

var users = [];
var current_id = 1;

var first_names = ["Dexter", "Lancelot", "Chad", "Juliet", "Carrie", "Maximillion", "Chastity", "Deborah", "Emmet"];
var adjectives = ["Bold", "Brave", "Fierce", "Lillylivered", "Intrepid", "Pugnacious", "Intransigent"];

var server = http.createServer(function(request, response){ 

	var path = request["url"];
	var method = request["method"];



	// debugger
	console.log("Connection from client has been made")

	console.log("Client is attempting to reach the " + path + " route with the " + method + " method");
	
	if(path == '/'){
		console.log(users);
		var index = fs.readFileSync("./index.html")
		response.end(index);
	} else if (path == "/user/create" && method == "POST") {
		var first_name = first_names[Math.floor(Math.random()*first_names.length)];
		var adjective = adjectives[Math.floor(Math.random()*adjectives.length)];
		var name = first_name  + " the " + adjective;

		var new_user = {
			id: current_id,
			name: name
		}

		users.push(new_user);
		current_id++;

		response.end(JSON.stringify(new_user));

	} else if (path.match(/\/user\/\d+/) != null) {
		// Get the id from the request path
		var id = path.split("/user/")[1];

		// Check to see if any user has the id specified in the URL
		for (var i = 0; i < users.length; i++) {
			if (users[i]["id"] == id) {
				// If so, return it as JSON
				response.end(JSON.stringify(users[i]));
			}
		}

		// No user with that ID was found; return empty object
		response.end("{}");

	} else if (path.match(/\/users\?*/) != null) {

		var query = path.split("?")[1];
		var params = query.split("&");

		var page_length = 0;
		var page_num = 0;

		for (var i=0; i < params.length; i++) {
			var param_name = params[i].split("=")[0];
			var param_value = params[i].split("=")[1];

			console.log(param_name, param_value);

			if (param_name == "page_length") {
				console.log("match!");
				page_length = parseInt(param_value);
			} else if (param_name == "page_num") {
				console.log("match!");
				page_num = parseInt(param_value);
				console.log(page_num);
			}
		}

		var start = page_length * (page_num - 1);
		var end = start + page_length;

		var result = [];
		for (var i = start; i < end; i++) {
			if (users.length > i) {
				result.push(users[i]);
			}
		}

		response.end(JSON.stringify(result));

	} else {
		response.end("<h1>ERROR</h1>");
	};

});

server.listen(2000);