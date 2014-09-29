var http = require("http");

var stringFunction = "var xhr = new XMLHttpRequest\n"
stringFunction += "xhr.open('GET', '/names', true)\n"
stringFunction += "xhr.send()\n"
stringFunction += "xhr.addEventListener('load', createList)\n"
stringFunction += "function createList(feed) {\n"
stringFunction += "var ul = document.createElement('ul')\n"
stringFunction += "feed.target.response.split(':').forEach(function(name) {\n"
stringFunction += "var li = document.createElement('li')\n"
stringFunction += "li.innerText = name\n"
stringFunction += "ul.appendChild(li)\n"
stringFunction += "})\n"
stringFunction += "document.body.appendChild(ul)\n"
stringFunction += "}\n"
var html = "<body><script>" + stringFunction + "</script></body>"


var server = http.createServer(function (req, resp) {

	var array = [ {name: "John", axe: "vocals", surname: "Lennon"}, {name: "Paul", axe: "bass", surname: "McCartney"}, {name: "George", axe: "guitar", surname: "Harrison" } ]
	var jsonArray = JSON.stringify(array)
	
	if (req.url.split("/")[1] == "names") {
		var string = ""
		array.forEach(function(person) {
			string  = string + person.name +":"
		})
		resp.end(string)
	}

	if (req.url.split("/")[1] == "people") {
		var string = ""
		array.forEach(function(person) {
			string = string + JSON.stringify(person) + "\n"
		})
		resp.end(string)
	}

	else {

		resp.end(html)
	}

})



server.listen(2000)