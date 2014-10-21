//api key = e45601ccca02c5af8036222be53a2f0f
//path: "/3/search/movie",

var request = require("request")

var movieOptions = {
	url: "http://api.themoviedb.org/3/search/movie",
	headers: {
		api_key: "e45601ccca02c5af8036222be53a2f0f",
		query: "aliens"
	}
}

function displayResults(err, resp, body){
	console.log(resp)
	console.log(body)
}

request(movieOptions, displayResults)