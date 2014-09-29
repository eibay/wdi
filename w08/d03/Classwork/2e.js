var http = require('http');
var fs = require("fs")
var server = http.createServer(function(request, response){
var path = request['url'];
msg = ""
if (path == "/hello"){
var information = fs.readFileSync('./text.txt')
msg = "<html><body><h1><link rel='stylesheet' href='/styles.css'></link><marquee>" + information+ "</marquee></h1></body></html>"
} else if (path == "/yo"){
  msg = "yo world"
} else if (path == "/styles.css"){
  msg = "h1{
    color:red;
  }"
}


response.end(msg)
});
server.listen(2000);
