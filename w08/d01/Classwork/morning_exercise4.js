var request = require('request');

request.get('www.dummyapi.com/cats', function (error, response, body) {
    nameArray = response
    console.log(nameArray.length)
    response.end(body) 
});
