var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

var server = http.createServer();

server.on('request', function(request, response) {

	var parsedRequest = url.parse(request.url, true);

	console.log('Sho');

	var xhr = new XMLHttpRequest();
      console.log('XMLHttpRequest');

      xhr.open('GET', '/namse');
      xhr.send();
xhr.addEventListener('load', function(ev){
      console.log('Got Callback');
      
      };

});

server.listen(2000);
