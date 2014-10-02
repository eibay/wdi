// How would one hit this api endpoint in the browser? What do you think the browser will display?
// Hit this api in the browser. Is it different than what you expected? Why?
// Would one be able to make an ajax call to this API? Why or why not?

// Make an HTTParty call to /joke in pry.Is this an ajax call? What's the difference between this and what you saw in the browser?

// Hit your server's one html route and in the javascript console try to make an Ajax call to /joke ( you don't need to do anything with the response)


var http = require('http');
var fs = require('fs');



var server = http.createServer(function(req, res) {
  var path = req.url
  if (path == "/joke") {
    var joke = ["programming is easy", "a guy walks into a bar", "why, i oughta..."]
    res.end(JSON.stringify(joke))
  }
  else if (path == "/") {
    res.end(fs.readFileSync('./index.html'));

  }
})

server.listen(2000);