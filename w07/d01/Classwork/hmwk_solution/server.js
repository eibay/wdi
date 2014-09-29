var request = require('request');

console.log('before request')

setTimeout(
	function() {
		console.log("hello")
	}, 3000);
request('http://localhost:2000/user/create', function(error, response, body){
	console.log('inside request')
	if (!error && response.statusCode == 200) {
		console.log(body)
	}
});
console.log('after request')