var http = require('http');
var fs = require('fs');

var heathers_characters = [
  {name: "Veronica Sawyer", age: "17", id: 1, quote:"What is your damage, Heather?", url: "http://oliviawedderburn.files.wordpress.com/2013/03/veronica-sawyer-heathers-winona-ryder.jpg"},
  {name: "Martha Dumptruck", age: "16", id: 2, quote: "I'd like that.", url: "http://www.gannett-cdn.com/-mm-/bfcf9458cd8dbdfcb41c4e4c0cc687a69750461e/c=37-0-475-329&r=x404&a..."},
  {name: "Betty Finn", age: "15", id: 3, quote: "Nice guys finish last, I should know", url: "http://photos1.blogger.com/blogger/1416/3034/1600/heathers48.0.jpg"},
  {name: "JD Dean", age: "20", id: 4, quote: "Chaos is what killed the dinosaurs, darling.", url: "http://img1.wikia.nocookie.net/__cb20120610233931/villains/images/b/bf/Jason_'J.D.'_Dean.jpg"},
  {name: "Heather Chandler", age: "21", id: 5, quote: "Did you have a brain tumor for breakfast?", url: "http://photos1.blogger.com/blogger/609/1846/1600/heather%201%20Heather%20Chandler.3.jpg"}
  ]

var server = http.createServer(function(request, response) {
	var path = request["url"];
	var path_one = request["url"].split("?")[0];

	if (path == "/") {

		var html = fs.readFileSync('index.html');
		response.end(html);

	} else if (path == "/user/create" && request["method"] == "POST") {

		var body = "";
		request.on('data', function(chunk) {
			body += chunk;
		});
		request.on('end', function(){

		console.log("POSTED: " + body);

		var new_member = {
			name: body.split("&")[0].split("=")[1],
			age: body.split("&")[1].split("=")[1],
			quote: body.split("&")[2].split("=")[1],
			url: body.split("&")[3].split("=")[1]
		}
		
		heathers_characters.push(new_member);
			
		last_item = heathers_characters[heathers_characters.length - 1];
		last_item["id"] = heathers_characters.indexOf(last_item) + 1;

		response.end(JSON.stringify(last_item));
	});
		
	} else if (path_one == "/user/user_id" && request["method"] == "GET") {

		id = path.split("?")[1].split("=")[1];

		heathers_characters.forEach(function(character) {
			if (character["id"] == id) {
			// 	name = "<li>" + character["name"] + "</li>"
			// 	age = "<li>" + character["age"] + "</li>"
			// 	quote = "<li>" + character["quote"] + "</li>"
			// 	image = "<li>" + "<a href=" + character["url"] + ">" + "Image</a></li>"
			// };
			// info = "<html><head></head><body><ul>" + name + age + quote + image + "</ul></body></html>"
			response.end(JSON.stringify(character));
			};
		});

	} else if (path_one == "/users") {

		var page_length = path.split("?")[1].split("&")[0].split("=")[1];
		var page_num = path.split("?")[1].split("&")[1].split("=")[1];
		var start = (page_length*page_num)-page_length;
		var last = page_length*page_num;
		var character_list = [];
		var json = "";
　
		for (i=start;i<last;i++) {
			character_list.push(heathers_characters[start]);
			start++;
		};

		character_list.forEach(function(character) {
			// name = "<li>" + character["name"] + "</li>"
			// age = "<li>" + character["age"] + "</li>"
			// quote = "<li>" + character["quote"] + "</li>"
			// image = "<li>" + "<a href=" + character["url"] + ">" + "Image</a></li><br/>"
			// html = html + name + age + quote + image
			json = json + JSON.stringify(character);
		});

		// info = "<html><head></head><body><ul>" + html + "</ul></body></html>"
		response.end(json);

	} else {

		response.end("<h1>Error!</h1>");

	};
 });

server.listen(2000);