var http = require('http');
var fs = require('fs');

var server = http.createServer(function (req, res) {

	res.end(fs.readFileSync('./name.html'))
});

server.listen(3000)