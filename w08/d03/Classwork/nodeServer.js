var http = require('http')
var fs = require('fs')

var server = http.createServer(function(req, res) {
	var path = req.url
	var names = ['Ted', 'Barney', 'Marshall', 'Lily', 'Robin']

	function jsonify(object) {
		return JSON.stringify(object)
	}
	

	if (path == '/hello') {
		res.end('<h1 style="color:blue">Hello World</h1>');

	} else if (path == '/marquee') {
		var helloMarquee = '<html><marquee>Hello World</marquee></html>';
		res.end(helloMarquee);

	} else if (path == '/file-marquee') {
		var content = fs.readFileSync('./file.txt');
		var message = '<html><marquee>' + content + '</marquee></html>'
		res.end(message)

	} else if (path == '/yo') {
		res.end('yo world')

	} else if (path == '/names-json') {
		var jsonNames = (JSON.stringify(names))
		res.end(jsonNames)

	} else if (path == '/json-function') {
		res.end(jsonify(names))
	} else if (path == '/attribute') {
		array = []
		hash1 = {}
		hash2 = {}
		hash3 = {}
		hash1['name'] = 'Joe'
		hash2['name'] = 'Julia'
		hash3['name'] = 'Rich'

		array.push(hash1, hash2, hash3)
		res.end(jsonify(array))

	}


});

server.listen(2000);
