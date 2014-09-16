var request = require('request');
request("http://localhost:2000/users/create", function(error, response, body) {
	if (!error && response.statusCode == 200) {
		console.log(body);
	}
})