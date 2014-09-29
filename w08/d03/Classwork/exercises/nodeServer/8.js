var fs = require("fs")
var http = require("http")
function returnArray(array) {
	var jsonArray = JSON.stringify(array)
	return jsonArray
}

var server = http.createServer(function(req, resp) {
	var array = ["Jacob", "Dylan", "Dweezil", "Hernando"]
	resp.end(returnArray(array))

})

server.listen(2000)