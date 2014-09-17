var http=require('http'); 
var fs=require('fs'); 

var server = http.createServer(function(req, res){ 
	
	if(req.url=="/"){
	res.end(fs.readFileSync('./tree.html'));
}

elsif(req.url=="/underscore.js")
{

		response.writeHeader(200, {"Content-Type": 'text/javascript'});
}

res.end(fs.readFileSync('./underscore.js'));



}); 


server.listen(2000);