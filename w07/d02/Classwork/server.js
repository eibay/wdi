var http = require ("http")
var fs = require ("fs")



var server = http.createServer(function(request, response){


	var html = fs.readFileSync("./tree.html")
	response.end(html)




})

server.listen(2000);