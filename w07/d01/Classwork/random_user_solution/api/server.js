var http = require("http")
var fs = require("fs")
var crypto = require('crypto');

var server = http.createServer(function(request, response){
console.log("Connection with client has been made");

	var path = request["url"];
	var method = request["method"];
	console.log("Client is attempting to" + method + path);
	
	var first = JSON.parse(fs.readFileSync('./first_names.txt'));
	var last = JSON.parse(fs.readFileSync('./last_names.txt'));
	var breed = JSON.parse(fs.readFileSync('./breeds.txt'));
	
if (path == "/user/create") {
		var x = Math.floor(Math.random() * 20);
		var y = Math.floor(Math.random() * 20);
		var z = Math.floor(Math.random() * 20);

		function randomValueHex (len) {
    		return crypto.randomBytes(Math.ceil(len/2))
        .toString('hex') 
        .slice(0,len);
				}

		var random_dog = {};
		random_dog["first"] = first[x];
		random_dog["last"] = last[y];
		random_dog["breed"] = breed[z];
		random_dog["id"] = randomValueHex(7)
		

		var random_array = JSON.parse(fs.readFileSync("./array_of_hashes.txt"));
		random_array.push(random_dog);
		fs.writeFileSync("./array_of_hashes.txt", JSON.stringify(random_array));

		var msg = JSON.stringify(random_dog);
	}

	else if (path.split("/")[1] == "user" && method == "GET") {
		var query_id = path.split("/")[2]
		random_array = JSON.parse(fs.readFileSync("./array_of_hashes.txt"));
		
		for (i = 0; i < random_array.length; i++) {
			if (random_array[i]["id"] == query_id) {
				msg = JSON.stringify(random_array[i])
			};}
	
	} else if (path.split("?")[0] == "/users") {
		var random_array = JSON.parse(fs.readFileSync("./array_of_hashes.txt"));
		var msg = random_array
		var num = parseInt(path.split("?")[1].split("&")[1].split("=")[1]);
		var length = parseInt(path.split("?")[1].split("&")[0].split("=")[1]);
		var start = length*(num-1);
		
		var list = random_array.slice(start, (start + length))
		var msg = JSON.stringify(list)

	} else {
		var msg = "Error 404. Page does not exist."
	}

	response.end(msg);
});

server.listen(2000);