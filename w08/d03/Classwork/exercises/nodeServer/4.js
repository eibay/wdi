var fs = require("fs")
var http = require("http")

var server = http.createServer(function(req, resp) {
	var text = fs.readFileSync("./3.txt")

	if (req.url.split("/")[1] == "hello"	) {
		resp.end(text)
	}
})

server.listen(2000)