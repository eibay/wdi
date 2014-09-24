var http = require('http');

var server = http.createServer(function(request, response){
	var path = request["url"];

	
	var html = "<html><script>console.log('Hello')</script></html"
	response.end(html);
});

server.listen(2000);