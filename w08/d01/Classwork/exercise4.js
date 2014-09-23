var request = require('request');

request.get("www.dummyapi.com/cats", function (error, response, body) {
	var response_parsed = JSON.parse(response)
	var numCats = response_parsed.length;
	console.log(numCats);
	response.end(body)
});

