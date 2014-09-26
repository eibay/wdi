// Create a server that just returns "Hello World" (for every route)
// Route that returns Hello World wrapped in a marquee tag
// Route that returns Hello World in a marquee tag, but read from a file
// Change the hello world route to '/hello'
// Add a route '/yo' that says "yo world" (with no additional files)
// Add CSS to style the hello route, but no CSS in a file
// Every route returns an array of names, in json
// Every route returns json of names that was returned from a function
// Every route calls a function that returns an array of 3 people, where each person is represented by a hash of attributes (e.g. name, age, etc)
// Two routes - one for names, one for people
// Use the node-simple-router library to simplify the above
var http = require('http');
var url = require('url');
var request = require('request');
var fs = require('fs');

var server = http.createServer(function(req, response) {

response.end("<html><marquee>Hello World</marquee></html>");

});
server.listen(2000);