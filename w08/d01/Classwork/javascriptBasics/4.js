
var http = require('http');
var url = require('url');
var request = require('request');
var fs = require('fs');


var server = http.createServer(function(req, response) {

  request("http://www.dummyapi.com/cats",function(error, response, body){
    answer = JSON.parse(body)
    response.end(answer)
    //loop through it in the html/css file

  })

}
