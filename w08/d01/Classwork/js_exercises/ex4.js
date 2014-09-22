var request = require('request');

request.get("http://www.dummyapi.com/cats", function(err, response, body){
  var api_res = JSON.parse(response.body);
  console.log(api_res.length);
})
