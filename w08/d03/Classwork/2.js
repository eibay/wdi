var Router = require('node-simple-router');
var fs = require('fs');
var http = require('http');

router = Router();

router.get('/hello', function(request, response) {

	html = fs.readFileSync('./hellomarquee.html');

	return response.end(html);

}); 

router.get('/yo', function(request, response) {

	response.end('Yo World');

});

router.get('/names', function(request, response) {

	var names = ['Eric', 'Maria', 'Conor', 'Clayton'];

	function spitNames(namearray) {
		return JSON.stringify(namearray);
	}

	return response.end(spitNames(names));	
});

router.get('/people', function(request, response) {

response.setRequestHeader("Content-type", "application/json");
response.setRequestHeader('Access-Control-Allow-Origin: *');

	function namesHash() {
		var people = {eric: 'cool', maria: 'awesome', conor: 'quick'};

		return JSON.stringify(people);
	}		

	return response.end(namesHash());
});

var server = http.createServer(router);

server.listen(2000);