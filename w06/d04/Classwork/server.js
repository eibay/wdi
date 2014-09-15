// require the libraries 
var http = require('http'); // http://nodejs.org/api/http.html  
var fs = require('fs'); // http://nodejs.org/api/fs.html 


// listen at port 2000 
// http://nodejs.org/api/http.html#http_server_listen_port_hostname_backlog_callback

function getFileStr(fileName){
	// get an html file fileName  
	var fileBuffer = fs.readFileSync(fileName); // when would you use readFile w/o synchrony  
	return fileBuffer.toString();
}


// establish the server logic 
// http://nodejs.org/api/http.html#http_http_createserver_requestlistener
var server = http.createServer(function(request, response){
	// no loops but eventListeners
	console.log("Client connected! Now I, the anonymous function, pass'd to the createServer method, execute!");

	// store the path 
	var path = request["url"]; 
	console.log("They want \"" + path + '\"!');


	if(path == '/') {
		var html = getFileStr("index.html");
		response.end(html); // http://nodejs.org/api/http.html#http_response_end_data_encoding 
	} else if(path == '/blue') {
		response.end("<h1>I'm blue, I'm beautiful, I'm best!</h1>");
	} else if(path == "/styles.css") {
		var stylesheet = getFileStr("lib/styles.css"); 
		response.end(stylesheet); 
	} else {
		response.end("<h1>404 Not Found</h1>"); 
	} 
}); 



server.listen(2000);
