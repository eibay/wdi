// * Every route returns json of names that was returned from a function
function names(){
 var array = ["tracy", "toral"]
 return array
}

var http = require('http');
var server = http.createServer(function(request, response){
var path = request['url'];
var array = names()
var JSONarray = JSON.stringify(array)
response.end(JSONarray)

});
server.listen(2000);

