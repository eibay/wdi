var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){

	console.log("You are connected to the server");

	var path = request["url"];

	var array = ["Jackie", "Fitch", "Gloria", "Eddie", "Eleanor"];
	var taggedString = []
	i = 0;

	console.log("Client is attempting to reach the" + path + " route");

	if (path == '/'){
		var html = fs.readFileSync('./index.html')
		response.end(html);
	} else if (path == '/characters'){
		var html = fs.readFileSync('./characters.html')
		while (i < array.length){
			taggedString.push('<li>' + array[i] + '</li>');
			i++;
		}
		var html = taggedString.join();
		html = html.replace("/,/g,");
		array = ("<html><body><ul>" + html + "</ul></body></html>");
		console.log(array)
		response.end(html);
	} else if (path == "styles.css"){
	      response.end(css);
	} else {
	      response.end("<h1>ERROR</h1>");
	    };
});

server.listen(2000);
     

