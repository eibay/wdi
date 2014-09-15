var http = require('http');
var fs = require('fs');
var friends=["Matt LeBlanc", "Courtney Cox", "Jennifer Aniston", "David Schwimmer", "Lisa Kudrow", "MatthewPerry"]
server=http.createServer(function (req, res) {

 es.writeHead(200, {'Content-Type': 'text/html'});
1 if(req.url=="/"){
  	console.log('Server running at http://127.0.0.1:2000/');
  	res.end(fs.readFileSync('index.html'));
}
else if(req.url=="/cast"){
// 		var str="<html><body><ul>";
// 	for(var i=0; i <= friends.length; i++){
// 		str=str+"<li>"+friends[i]+"</li>";
// }
// 	str=str+"</ul></body></html>";
	res.end("Hello");

}



})


server.listen(2000);

