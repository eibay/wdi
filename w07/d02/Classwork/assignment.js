var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request,response){
	var tree = fs.readFileSync('./tree.html');
	response.end(tree);
});
server.listen(2000);