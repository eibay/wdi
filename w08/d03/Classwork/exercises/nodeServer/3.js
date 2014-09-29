var fs = require("fs")
var http = require("http")

var server = http.createServer(function(req, resp) {
	var text = fs.readFileSync("./3.txt")
	resp.end(text)
})

server.listen(2000)