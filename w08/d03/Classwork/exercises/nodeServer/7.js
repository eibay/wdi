var fs = require("fs")
var http = require("http")
var array = ["Jacob", "Dylan", "Dweezil", "Hernando"]

var server = http.createServer(function(req, resp) {

	resp.end(JSON.stringify(array))

})

server.listen(2000)