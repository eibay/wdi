var http = require('http');
var fs = require('fs');
var util = require('util');
var server = http.createServer(function(req, res){

var friends = ["Rachel Green", "Monica Geller", "Phoebe Buffay", "Chandler Bing", "Ross Geller", "Joey Tribbiani"]

// var friend = function findFriends(friends){
//   for (var i; i < friends.length; i++){
//     return friends[index]
//   }
// };

  var path = req["url"];
  debugger



  if (path == "/"){
    res.end("<a href='/friends'>Members of Friends</a><br /><a href='/friends/random'>Random Member of Friends</a>");
  } else if (path == "/friends") {
    res.end("", function(){for (var i; i< friends.length; i++){
"<h1>Friends</h1><ul><li>"+i+"</li></ul>"}});
  } else {
    res.end("yeaaah...no");
  }

});

server.listen(2000);
