var url = "www.dummyapi.com/cats"


request(url, function (error, response, body){
	var cats = JSON.parse(body)
	return cats.length 


})