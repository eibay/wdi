var http = require('http');
var fs = require("fs")
var server = http.createServer(function(request, response){
var path = request['url'];
msg = ""
if (path == "/hello"){
var information = fs.readFileSync('./text.txt')
msg = "<html><body><marquee>" + information+ "</marquee></body></html>"
} else if (path == "/yo"){
  msg = "yo world"
}

response.end(msg)
});
server.listen(2000);
