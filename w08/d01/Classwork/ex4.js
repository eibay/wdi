var url = "www.dummyapi.com/cats"


request(url, function (error, response, body){
	var cats = JSON.parse(body)
	var length = Object(cats).keys
	return length
})