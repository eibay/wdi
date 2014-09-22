request('www.dummyapi.com/cats', function(error, response, body) {
	cats = JSON.parse(request.body);
	console.log(cats.length);
})