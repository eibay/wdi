
var http = require('http');
var server = http.createServer(function(request, response){
var path = request['url'];
var array = ["tracy", "toral"]
var JSONarray = JSON.stringify(array)
response.end(JSONarray)

});
server.listen(2000);

