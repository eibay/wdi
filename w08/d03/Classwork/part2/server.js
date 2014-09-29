var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
var path = request['url'];
		console.log(path)
var greeting = "<h1 style='font-family: Helvetica'>Hello World!</h1>"
var marquee = "<html><marquee><h1 style='font-family: Helvetica'>Hello World!</h1></marquee></html>"
var yo = "<h1>Yo world!</h1>"

var namesArray = ["Peter", "Paul", "Mary"]
var attrHash = [{name: "Peter", role: "singer"}, {name: "Paul", role: "Also a singer"}, {name: "Mary", role: "Yet another singer" }]

		if (path == "/hello") {
			response.end(greeting + makeJSON(namesArray) + '\n' + returnAttributes(attrHash)); 
		} else if (path == "/marquee"){
			response.end(marquee + makeJSON(namesArray) + '\n' + returnAttributes(attrHash));
		} else if (path == "/marquee2"){
			var html = fs.readFileSync("./marquee.html")
			response.end(html); 
		} else if (path == '/yo') {
			response.end(yo + makeJSON(namesArray) + '\n' + returnAttributes(attrHash));
		} else if (path == '/names') {
			response.end(makeJSON(namesArray));
 		} else if (path == '/people') {
 		response.end(returnAttributes(attrHash));
		} else {
			response.end(greeting);
		};
});


server.listen(2000);

function makeJSON(arr) {
	var names = JSON.stringify(arr);
	return names	
}

function returnAttributes(arr) {
var newArray = [];
	for (var i=0; i < arr.length; i++) {
		newArray.push(arr[i]);
	}		
	return JSON.stringify(newArray);
}