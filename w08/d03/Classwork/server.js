var http = require('http');
var fs = require('fs');

var server = http.createServer(function (req, res) {
	
	if(req.url=="/marquee"){
		console.log(req.url)
		res.end('<html><body><marquee><h1>Hello Word</h1></marquee></body></html>')

	}
	else if(req.url=="/marqueefile"){
		console.log(req.url)
		res.end(fs.readFileSync('marquee.html'))

}
	else if(req.url=="/hello"){
		console.log(req.url)
		res.end('<html><head><style type="text/css">body{background-color:blue;}</style></head><body>Hello World</body></html>');
	}
	else if(req.url=='/yo'){
		res.end('yo world')


	}

	

});

server.listen(2000)