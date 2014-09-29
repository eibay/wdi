var http = require("http")

var server = http.createServer(function(req, resp){


	var html = "<body><script type='text/javascript'>console.log('Daniel Farber')</script></body>"
	resp.end(html)



})

server.listen(2000)