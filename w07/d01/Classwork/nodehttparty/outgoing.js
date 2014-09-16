var request = require("request");

console.log("before request")

setTimeout(
	function() {
		console.log("Hello!")
	}, 3000);

request("http://localhost:2000/users?page_length=5&page_num=1", function(error, response, body){
	if (!error && response.statusCode == 200) {
		console.log(body);
		console.log("inside request");
	}
})


console.log("after request")