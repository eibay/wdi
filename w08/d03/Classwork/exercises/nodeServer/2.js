var http = require("http")

var server = http.createServer(function(req, resp) {
	resp.end("<body><marquee>Hello World</marquee></body>")
})

server.listen(2000)