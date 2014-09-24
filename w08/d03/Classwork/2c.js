var http = require('http');
var fs = require("fs")
var server = http.createServer(function(request, response){
var path = request['url'];

var information = fs.readFileSync('./text.txt')
response.end("<html><body><marquee>" + information+ "</marquee></body></html>")

});
server.listen(2000);
