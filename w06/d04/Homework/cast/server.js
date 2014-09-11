var http = require("http");
var fs = require("fs");

cast = ["David Schwimmer", "Lisa Kudrow", "Matthew Perry", "Courtney Cox", "Matt LeBlanc", "Jennifer Aniston"]


var server = http.createServer(function(request, response) {

	path = request["url"];
	var paths = path.split("/");

	if (path == "/") {
		var page = fs.readFileSync("./views/index.html");
		response.end(page);
	}

	else if (paths[1] == "cast" && paths.length == 2 && request["method"] == "GET") {
		var page = fs.readFileSync("./views/cast.html");
		var list = "";
		each(cast, function(actor) {
			list = list + "<li>" + actor + "</li>";
		})
		page = page.toString().replace("{{list}}", list);
		response.end(page)
	}

	else if (paths[1] == "cast" && paths[2] == "random") {
		index = Math.floor(Math.random() * 6);
		var page = fs.readFileSync("./views/random.html").toString();
		page = page.replace("{{friend}}", cast[index]);
		response.end(page);
	}

	else if (paths[1].split("?")[0] == "hello") {
		var name = paths[1].split("?")[1].split("=")[1];
		response.end("<h1>Hello, " + name + "!</h1>");
	}

	else if (paths[1] == "cast" && paths[2] == "new") {
		var page = fs.readFileSync("./views/cast_new.html");
		response.end(page);
	}

	else if (request["method"] == "POST" && paths[1] == "cast") {
		var body = "";
		
		request.on('data', function(chunk) {
			body += chunk;
		});

		request.on('end', function(){
			debugger
			console.log("POSTED: " + body);
			page = fs.readFileSync("./views/cast.html", "UTF-8");
			var name = body.split("=")[1].replace("+", " ")
			cast.push(name)
			var list = "";
			each(cast, function(actor) {
			list = list + "<li>" + actor + "</li>";
			});
			page = page.replace("{{list}}", list)

			response.end(page);
		});
	};
});
		

server.listen(2000)



function each(array, someThing) {
	ind = 0;
	while (ind < array.length) {
		someThing(array[ind]);
		ind = ind +1;
	};
};
