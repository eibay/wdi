var request = require('request');

request("www.dummyapi.com/cats", function (error, response, body) {
	var numCats = response.length;
	console.log(numCats);
});

