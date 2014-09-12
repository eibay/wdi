var http = require('http');
var fs = require('fs');
var util = require('util');
var server = http.createServer(function(req, res){

var friends = ["Rachel Green", "Monica Geller", "Phoebe Buffay", "Chandler Bing", "Ross Geller", "Joey Tribbiani"]

var list = "<html><body><ul>";

  for (var i; i < friends.length; i++){
    list = list + "<li>" + friends[i] + "</li>";
  };

  list = list + "</ul></body></html>";


  var path = req["url"];
  debugger



  if (path == "/"){
    res.end("<a href='/friends'>Members of Friends</a><br /><a href='/friends/random'>Random Member of Friends</a>");
  } else if (path == "/friends") {
    res.end("list");
  } else {
    res.end("yeaaah...no");
  }

});

server.listen(2000);
