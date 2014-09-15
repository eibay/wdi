var http = require('http');
var fs = require('fs');


var adj = JSON.parse(fs.readFileSync('./adj.txt'));
var noun = JSON.parse(fs.readFileSync('./noun.txt'));

var server = http.createServer(function(request, response){
var path = request["url"];
var query = path.split("/")[1];
var adj_result = [];
var noun_result = [];

  function makeName(array){
    for(var i=0;i<array.length;i++){
      var name = array[parseInt(Math.random() * array.length)];
      if (array == "adj"){
        debugger;
        adj_result.push(name);
        // console.log(adj_result);
        var key = Object.keys(name);
        // return this later maybe name[key];
        return name;
      } else {
        noun_result.push(name);
        // console.log(noun_result);
        var key = Object.keys(name);
        // return name[key];
        return name;
      }
    }
  }

  function makeID(){

  }

  if (path == "/user/create"){
    fs.readFileSync('./names.txt').toString();
    var display_result = [];
    var name_adj = makeName(adj);
    var name_noun = makeName(noun);
    display_result.push(name_adj);
    display_result.push(name_noun);
    var name_result = JSON.stringify(display_result);
    // var a_adj = makeName(adj);
    // var n_noun = makeName(noun);
    // var translation = Object.keys(a_adj) + " " + Object.keys(n_noun);
    fs.appendFileSync('./names.txt', name_result.substr(1, name_result.length-2));
    
    response.end(name_result);
  }
});

// console.log(matchStuff(adj));
// console.log(makeName(adj));
// // { black: 'vutha' }
// console.log(makeName(noun));
// // { blood: 'iejir' }
// console.log(JSON.stringify(makeName(adj)).split(":")[0]);
// // {"blue"
// console.log(makeName(noun).toString());
// [object Object]

server.listen(2000);
