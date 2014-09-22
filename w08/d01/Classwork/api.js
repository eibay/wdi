var http = require('http');
var httpClient = require('request');
var url = require('url');

request('http://www.dummyapi.com/cats', function (error, response, body) {
     var array = body.split(', ');
     console.log(array);
});