var url = "www.dummyapi.com/cats"


request(url, function (error, response, body){
	url= ""
	var cats = JSON.parse(body)
	return cats.length 


})