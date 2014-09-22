var request = require('request');

request.get("www.dummyapi.com/cats", function (error, response, body) {
	var numCats = response.length;
	console.log(numCats);
	response.end(body)
});

