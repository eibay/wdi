var request = require('request');

console.log('before request')

request('http://localhost:2000/user/create', function (error, response, body) {

		// request method is asynchronous (fires function body after response)
		console.log('inside request')

	  if (!error && response.statusCode == 200) {
	    console.log(body) // Print the google web page.
	  }
})

console.log('after request')