var fs = require('fs');
var http = require("http");
var httpClient = require("request");
var url = require("url");

var server = http.createServer();

server.on("request"), function(request, response) {
	var parsedRequest = url.parse(request.url, true);
	console.log("request received to " + parsedRequest.path);

	if (parsedRequest.pathname == "/") {
		response.end(fs.readFileSync("./index.html"));
	} else if (parsedRequest.pathname == "/city") {parsedRequest.query.city;
		var city = "Manila, Philippines"
		var response = httpClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + encodeURIComponent(city) + "&sensor=false&key=AIzaSyA2B6Mxp9ll7QXSN0SiKoALd1ig93AziiI", function(err, res2, body){
			return (body)
		})response.end()
	}
}

require 'sinatra'
require 'json'
require 'httparty'

get ('/:city') do
	url = URI.encode("https://maps.googleapis.com/maps/api/geocode/json?address=#{params['city']}&sensor=false&key=AIzaSyA2B6Mxp9ll7QXSN0SiKoALd1ig93AziiI"
