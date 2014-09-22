var http = require("http");
var url = require("url");
var request = require("request");
var fs = require("fs");

var server = http.createServer(function(request, response) {
  var path = request.url
  console.log(path)
  if (path == "/") {
    response.end(fs.readFileSync("./index.html"));
  }
  else if (path == "/style") {
    response.end(fs.readFileSync("./style.css"));
  }
  else if (path == "/game") {
    response.end(fs.readFileSync("./js/game.js"));
  }
  else if (path == "/new_word") {
    var randomWordUrl = "http://api.wordnik.com:80/v4/words.json/randomWord?hasDictionaryDef=true&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=6&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5";
    wordArray = []
    request(randomWordUrl, function (err, res, body) {
      var json = JSON.parse(body);
      wordArray.push(json["word"])
      })
        response.end(JSON.stringify(wordArray));
  }
  else if (path == "/favicon.ico") {
    response.end(fs.readFileSync("./favicon.ico"));
  }
  else {
    response.end("Error 404");
  }
});
server.listen(2000);