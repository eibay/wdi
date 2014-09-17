var http = require("http")
var fs = require("fs")

server = http.createServer(function(request, response) {
	output = fs.readFileSync("./views/tree.html")
	response.end(output)
})

server.listen(2000)