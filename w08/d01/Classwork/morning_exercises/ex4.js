var http = require('http');


http.get("www.dummyapi.com/cats", function(response) {
	response.on('data', function(data) {
		var catsArray = JSON.parse(String(data)); 
		console.log(catsArray.length);
	})
}) 