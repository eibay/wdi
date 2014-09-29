var http = require("http");

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

})

server.listen(2000)