var http = require('http')
var fs = require('fs')



var server = http.createServer(function(req, res) {
	var path = req['url']
	
	res.end(fs.readFileSync('./tree.html'))
})

server.listen(2000);