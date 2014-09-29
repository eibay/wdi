var http = require('http')
var fs = require('fs')

var server = http.createServer(function(req, res) {
	var path = req.url

	function jsonify(object) {
		return JSON.stringify(object)
	}

	var html = '<html><script>console.log("Joe")</script></html>'
	res.end(html)









});

server.listen(2000);