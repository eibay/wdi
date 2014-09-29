var http = require("http");

var stringFunction = "var xhr = new XMLHttpRequest\n"
stringFunction += "xhr.open('GET', '/names', true)\n"
stringFunction += "xhr.send()\n"
stringFunction += "xhr.addEventListener('load', function(e) {\nconsole.log(xhr.response)\n})\n"
var html = "<body><script>" + stringFunction + "</script></body>"


var server = http.createServer(function (req, resp) {

	var array = [ {name: "John", axe: "vocals", surname: "Lennon"}, {name: "Paul", axe: "bass", surname: "McCartney"}, {name: "George", axe: "guitar", surname: "Harrison" } ]
	var jsonArray = JSON.stringify(array)
	
	if (req.url.split("/")[1] == "names") {
		var string = ""
		array.forEach(function(person) {
			string  = string + person.name +"\n"
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