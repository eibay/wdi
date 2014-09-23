var request = require('request');

request.get('www.dummyapi.com/cats', function (error, response, body) {
    var nameArray = JSON.parse(response)
    console.log(nameArray.length)
    response.end(body) 
});