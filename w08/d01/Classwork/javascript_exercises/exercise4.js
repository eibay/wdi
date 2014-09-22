var request = require("request")
var apiUrl = "http//:www.dummyapi.com/cats"

request(apiUrl, function (error, response, body){
	var catNames = JSON.parse(body)
	console.log(catNames.length)
})