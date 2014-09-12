var http = require('http');
var redis = require('node-redis'); 
var url = require('url'); 
var fs = require('fs');

var client = redis.createClient(); 

var server = http.createServer(function(request, response){
	var method = request.method; // "GET"
	var url_parts = url.parse(request.url, true);
	var path = url_parts.pathname; // "/hello"
	var query = url_parts.query; // { name: 'cheryl' }

	if(method == "POST"){
		if(path == "/user/create"){

		} else {
			response.end("<h1>404 Not Found</h1>"); 
		}
	} else if(method == "GET"){
		if(path == "/user/user_id"){

		} else if(path == "/users"){

		} else {
			response.end("<h1>404 Not Found</h1>"); 
		}
	} else {
		response.end("<h1>404 Not Found</h1>"); 
	}

});

server.listen(2000);
