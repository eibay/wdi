var http = require('http');
var request = require('request');
var url = require('url');

request.get('www.dummyapi.com/cats', function (error, response, body) {
    debugger
    console.log(body);
});