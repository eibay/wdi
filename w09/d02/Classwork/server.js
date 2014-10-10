//// 1. How would one hit this api endpoint in the browser? What do you think the browser will display?

// API- is a set of rules to dictate how software talk to the browser or any other program. In this case, the browser would show, "programming is easy." We would go to localhost:2000/joke to see API endpoint.

//// 2. Hit this api in the browser. Is it different than what you expected? Why?

// "programming is easy"

//// 3. Would one be able to make an ajax call to this API? Why or why not?

// AJAX is an HTTP call that is from the browser. HTTParty is from the browser. YES, we would be able to do an AJAX call.

// Make an HTTParty call to /joke in pry.

// require 'httparty'                                               

// joke = HTTParty.get("http://localhost:2000/joke")                
// "\"programming is easy\""
     
//// Is this an ajax call? What's the difference between this and what you saw in the browser?

//// Create an index.html with just html and body tags.

//// How would you go about viewing this html in the browser? Is your method using a server?

//// If you run server.js can you access index.html from this server? Why or why not? Either way, figure out how to get to index.html by using and/or modifying server.js.


//// Hit your server's one html route and in the javascript console try to make an Ajax call to /joke ( you don't need to do anything with the response)

// Add inline javascript to index.html to access /joke and console.log the response. (on HTML page)

// xhr done done in console
	// var xhr = new XMLHttpRequest();
	// xhr.open('GET', 'http://localhost:2000/joke', true)
	// xhr.send();

var http = require('http')
var fs = require('fs');

var server = http.createServer(function(req, res) {
  var path = req.url
  if (path == "/joke") {
    var joke = ["programming is easy", "programming isn't frustrating", "programming is really really easy"]
    res.end(JSON.stringify(joke)
 )} 
  else if (path == "/") {
  res.end(fs.readFileSync('./index.html'));
  }
})
server.listen(2000);

// // ajax jquery (done in console)

// $.ajax({
// 	url:"http://localhost:2000/joke",
// 	type:"GET"
// }).done(function(data){
// console.log(data);
// })

// function makeCall(){
// $.ajax({
// 	url:"http://localhost:2000/joke",
//  	type:"GET"
// 	}).done(function(data){
//  	console.log(data);
// 	 })
// 	console.log("testing");
// };


