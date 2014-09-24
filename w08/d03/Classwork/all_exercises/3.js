var http = require('http');

var server = http.createServer(function(request, response) {

var xhr = new XMLHttpRequest();
xhr.open('GET', 'http://127.0.0.1:2000/names', true);
xhr.send();

xhr.addEventListener('load', function(){

	var names = JSON.parse(xhr.response);
	console.log(names);
})

	
});

server.listen(3000);