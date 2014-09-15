var http = require('http');

var random_users = [
  {name: "Johnny Bananas", age: "25"},
  {name: "Princess Consuela", age: "30"},
  {name: "Mr. Rogers", age: "50"}
  ];

var info = ["Lover of Bananas", "Looks over kingdom of maids", "The best neighbor ever"]


var server = http.createServer(function(request, response){

   var path = request["url"];
   var method = request["method"];
   var dynamic_name = path.split("/")[2]

     if (path == "/user/create" && method == "POST") {

      random_users_in_json = JSON.stringify(random_users);
      response.end(random_users_in_json);

     } else if (path == "/user/user_id" && method == "GET") {
        random_characters.forEach(function(character) {

          if (character["name"] == "user_id") {
            response.end(JSON.stringify(character));

        }

     } else {

        response.end("<h1> Error </h1>");
     }

  });

server.listen(2000);

