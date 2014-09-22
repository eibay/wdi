var http = require("http");

http.request("http://www.dummyapi.com/cats", function(error, response, body) {
	console.log(JSON.parse(response).length)
})