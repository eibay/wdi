var http = require("http");

var server = http.createServer(function (req, resp) {

	var array = [ {name: "John", axe: "vocals", surname: "Lennon"}, {name: "Paul", axe: "bass", surname: "McCartney"}, {name: "George", axe: "guitar", surname: "Harrison" } ]
	var jsonArray = JSON.stringify(array)
	resp.end(jsonArray)

})

server.listen(2000)