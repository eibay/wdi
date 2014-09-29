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

response.setHeader("Content-type", "application/json");
response.setHeader('Access-Control-Allow-Origin', '*');

	var names = ['Eric', 'Maria', 'Conor', 'Clayton'];

	function spitNames(namearray) {
		return JSON.stringify(namearray);
	}

	response.end(spitNames(names));	
});

router.get('/people', function(request, response) {

	function namesHash() {
		var people = {eric: 'cool', maria: 'awesome', conor: 'quick'};

		return JSON.stringify(people);
	}		

	return response.end(namesHash());
});

var server = http.createServer(router);

server.listen(2000);