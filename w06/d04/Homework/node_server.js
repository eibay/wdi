  var http = require('http');
  var fs = require('fs');

  var friends = ["Rachel Green", "Monica Geller Bing", "Phoebe Buffay", "Ross Geller", "Chandler Bing", "Joey Tribianni"]

    var server = http.createServer(function(request, response) {

      console.log("Connection has been made, Rosencrantz for life")

      var path = request["url"];

      if (path == "/") {

      var index = fs.readFileSync("./views/index.html")

      response.end(index);

            } else if (path == "/cast") {

            i = 0

            var cast = ""

            while (i < friends.length) {
            var cast = cast  + "<li>" + friends[i] + "</li>"

                i += 1

            }

            cast_members = "<html><h1>The cast of friends</h1><ul>" + cast + "</ul></html>"

            response.end(cast_members);

          } else if (path == "/cast/random") {

            var random_members = friends[Math.round(friends.length * Math.random()) ]

            var random_members = "<html><h1> Here is your random cast member: </h1>" + "<h2>" +

            random_members + "</h2></html>"

            response.end(random_members);

          } else if (path.split("?").length > 1) {

            // http://127.0.0.1:2000/hello?name=ff

           var name = path.split("?")[1].split("=")[1];

            response.end("<h1> Hey " + name + "</h1>");


            } else if (path == "/styles.css") {

            var css = fs.readFileSync("./views/styles.css")

            response.end(css);

            } else {

          response.end("<h1>No friend here mate<h1>");

         };

      }); // if path == / ending bracket


server.listen(2000);

