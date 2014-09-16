var http = require('http');

var characters = [
	{name: "Fred Flinstone", age: "40", id: 1, url: "http://1.bp.blogspot.com/_BHp6iAhvNos/TU291DYUSqI/AAAAAAAAAnw/SgjJVu6lz1Y/s1600/fred-flintstone.jpg"},
	{name: "Barney Rumble", age: "39", id: 2, url: "http://upload.wikimedia.org/wikipedia/en/thumb/e/e2/Barney_Rubble.png/160px-Barney_Rubble.png"},
	{name: "Steve Rogers", age: "89", id: 3, url: "http://static.comicvine.com/uploads/original/12/122233/3779435-captain_america__the_first_avenger_ipod_wallpaper_by_stephencanlas-d53esbp.jpg"},
	{name: "Bruce Wayne", age: "38", id: 4, url: "http://static.comicvine.com/uploads/original/11116/111164870/3859882-6269102771-Bruce.jpg"},
	{name: "Frodo", age: "28", id: 5, url: "http://reslife.web.unc.edu/files/2012/02/FRODO.jpg"},
	{name: "Homer Simpson", age: "40", id: 6, url: "http://s3.amazonaws.com/rapgenius/Homer_Simpson_Vector_by_bark2008.png"}
	]

var names = ["Joe", "Bob", "Arnold", "Goku"]
var ages = ["20", "30", "40", "80"]

var server = http.createServer(function(req, res) {

	var path = req['url'];
	var method = req['method'];
	var dynamic = path.split("/")[2]


	if (path == "/user/create" && method == "GET") {

		new_char = createPerson()
		msg = JSON.stringify(new_char)

	} else if (path == "/user/" + dynamic) {
		
		// characters.forEach(function(character) {
		// 	if (character["id"] == dynamic) {
		// 		msg = JSON.stringify(character);
		// 	}
		// });

		character = personById(dynamic);

		msg  = JSON.stringify(character);

	} else if (path.split("/")[1].length > 15) {

		// var page_length = parseInt(path.split("=")[1].split("&")[0]);
		// var page_num = parseInt(path.split("=")[2]);

		var params = paramify(path)
		var page_length = params.page_length
		var page_num = params.page_num

		var first = ((page_length * page_num) - (page_length - 1))
		var last = ((page_length * page_num) + 1)
		var character_range = characters.slice(first, last)


		if (characters[first] == undefined) {
			msg = "ERROR";
		} else {
			msg = JSON.stringify(character_range);
		}

	} else if (path == "/users") {
		msg = JSON.stringify(characters);
	};

	res.end(msg)
});

function createPerson() {
	var names = ["Joe", "Bob", "Arnold", "Goku"];
	var ages = ["20", "30", "40", "80"];

	var name = randomize(names);
	var age = randomize(ages);

	var new_char = {name: name, age: age, id: (characters.length + 1)}
	characters.push(new_char);

	console.log("Characters now equals...")
	console.log(characters)

	return new_char
}

function randomize(arr) {
	var element = arr[Math.floor(arr.length * Math.random())];
	return element;
}

function personById(id) {
	for(var i=0; i < characters.length; i++) {
		if (characters[i].id == id) {
			return characters[i];
		}
	}
	return {};
}

function paramify(path) {
	var qs = path.split("?")[1]
	var params = qs.split("&")

	var goodParams = {}
	params.forEach(function(param) {
		var key = param.split("=")[0]
		var value = param.split("=")[1]
		goodParams[key] = value

	});
	return goodParams
}


server.listen(2000);



