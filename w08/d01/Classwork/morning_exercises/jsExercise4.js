request(url, function(error, response, body){

	var parsedResponse = JSON.parse(response);
	console.log(parsedResponse.length)

});