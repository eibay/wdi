// 2. Node Server
//   * Create a server that just returns "Hello World" (for every route)
//   * Route that returns Hello World wrapped in a marquee tag
//   * Route that returns Hello World in a marquee tag, but read from a file
//   * Change the hello world route to '/hello'
//   * Add a route '/yo' that says "yo world" (with no additional files)
//   * Add CSS to style the hello route, but no CSS in a file
//   * Every route returns an array of names, in json
//   * Every route returns json of names that was returned from a function
//   * Every route calls a function that returns a hash of 3 people with attributes
//   * Two routes - one for names, one for people
//   * Use the `node-simple-router` library to simplify the above


var http = require('http');
var fs = require('fs');


var server = http.createServer(function(request, response) {
  var path = request["url"]; // has to be inside because otherwise there isnt a request yet
  function jsonify(namesArray){
    return JSON.stringify(namesArray);
  }
  if(path == "/"){
    response.end("Hello Root");
  } else if(path=="/hello"){
    response.end("<h1 style='color: red;'>Hello World</h1>");
  } else if(path == "/octopus"){
    response.end("Hello Octopus World");
  } else if(path=="/marquee"){
    response.end("<html><body><marquee>Hello Marquee World</marquee></body></html>");
  } else if(path=="/marquee_file"){
    response.end(fs.readFileSync("./marquee.txt"));
  } else if(path=="/yo"){
    response.end("yo world");
  } else if(path=="/array_of_names"){
    var array_of_names = ["alice", "bob", "carol"];
    var array_parsed = JSON.stringify(array_of_names);
    response.end(array_parsed);   
  } else if(path=="/json_of_names"){
    var ary =  ["octopus", "cuttlefish", "squid"];
    var stuff_jsoned = jsonify(ary);
    response.end(stuff_jsoned);
  } else if(path=="/hash") {
    var array = [];
    var hash1 = {"alice": 1}
    var hash2 = {"bob": 2}
    var hash3 = {"carol": 3}

    array.push(hash1);
    array.push(hash2);
    array.push(hash3);

    response.end(jsonify(array));
  }
});

server.listen(2000);


