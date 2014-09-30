var fs = require("fs")
var http = require("http")

var server = http.createServer(function(req, resp) {
	resp.setHeader("access-control-allow-origin", "*")
	resp.setHeader("domain", "http://127.0.0.1:2000")
	debugger;
	resp.end("end")
})

server.listen(2000)