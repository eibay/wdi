Every route calls a function that returns an array of 3 people, where each person is represented by a hash of attributes (e.g. name, age, etc)

function hash(){
 var hash1 = {tracy: 1}
 var hash2 = {tejal: 2}
 var hash3 = {toral: 3}
 var array = [hash1, hash2, hash3]
 return array
}

var http = require('http');
var server = http.createServer(function(request, response){
var path = request['url'];
var array = hash()
var JSONarray = JSON.stringify(array)
response.end(JSONarray)

});
server.listen(2000);

