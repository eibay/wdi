var fs = require('fs');
var http = require('http');
var Router = require('node-simple-router');
var httpClient = require('request');
var url = require('url');
var router = Router(); // may also be router = new Router();


var server = http.createServer();

server.on('request', function(request, response) {

  var person = {Sho: "Blue", Sean: "Red", Jeff: "White"};
  var people = [
  	{	name: "Sho",
  		age: "24",
  		color: "Green"
  	},
  	{
  		name: "Sean",
  		age: "30",
  		color: "Black"
  	},
  	{
  		name: "Jeff",
  		age: "32",
  		color: "Red"
  	}
  ];

  var parsedRequest = url.parse(request.url, true);

  if (parsedRequest.pathname == "/hello") {
  	// var css = fs.readFileSync('styles.css');
  	// var hello_world = '<h1 style="color: red;">Hello World!</h1>';
  	// response.end(hello_world);
  	// people = JSON.stringify(people);
  	// response.end(people);
  	// response.end(returnName(people));
  	// response.end(returnHash(people));
  } else if (parsedRequest.pathname == "/people") {
  	response.end(returnHash(people));
  } else if (parsedRequest.pathname == "/names") {
	response.end(returnName(people));
  } else if (parsedRequest.pathname == "/yo") {
  	response.end('Yo!');
  } else if (parsedRequest.pathname == "/marquee") {
  	var marquee = '<h1><marquee>Hello World!</marquee></h1>';
  	response.end(marquee);
  } else if (parsedRequest.pathname == "/marqueefile") {
  	var file = fs.readFileSync('file.txt')
  	response.end(file);
  }

});

server.listen(2000);

function returnName(hash) {
	var arry = Object.keys(hash);
	var list = "";
	for(var i=0;i<arry.length;i++) {
		list = list + arry[i] + " ";
	}
	return list;
};

function returnHash(arry) {
	return JSON.stringify(arry);
};

function returnName(arry) {
	var names = [];
	for(var i=0;i<arry.length;i++) {
		names.push(arry[i]["name"])
	}
	return names
}










