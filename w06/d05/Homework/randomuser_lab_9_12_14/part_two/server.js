var fs = require("fs");
var http = require("http");

var first_names = JSON.parse(fs.readFileSync("./first_names.txt", "UTF8"));
var last_names = JSON.parse(fs.readFileSync("./last_names.txt", "UTF8"));
var locations = JSON.parse(fs.readFileSync("./locations.txt"));

var users = []



server = http.createServer(function(req, resp){
	var path = req["url"];
	var paths = path.split("/")

	if (path == "/user/create") {
		var user = createUser();
		json_user = JSON.stringify(user);
		resp.end(json_user);
	}

	else if (paths[1] == "user" && parseInt(paths[2]) < users.length) {
		var i = parseInt(paths[2]);
		var json_user = JSON.stringify(users[i]);
		resp.end(json_user);
	}

	if (path.indexOf("?") != -1) {
		var params = genParams(path);
		var index_two = params["page_num"] * params["page_length"];
		var index_one = index_two - params["page_length"];
		json_user = JSON.stringify(users.slice(index_one, index_two));
		resp.end(json_user);
	}

})

server.listen(2000);

function extractRandomly(array) {
	rand = Math.floor(Math.random() * array.length);
	return array[rand];

}

function createUser() {
	user = {
		"first": extractRandomly(first_names),
		"last": extractRandomly(last_names),
		"location": extractRandomly(locations),
		"id": users.length,
	}
	users.push(user)
	return user
}

function genParams(path) {
	
	var dummies = path.split("?")[1].split("&")
	params = {};
	params[dummies[0].split("=")[0]] = dummies[0].split("=")[1];
	params[dummies[1].split("=")[0]] = dummies[1].split("=")[1];
	return params;
}





