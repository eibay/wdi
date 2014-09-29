var http = require('http');
var fs = require('fs'); 

function peopleWithAttributes() {
  var value = {
    person: {color: "transparent", purpose: "Kick Ass", hobbies: "Chew Bubble Gum"}, 
    otherPerson: {real: true, action: "/method", hopefully: "Size 11"}, 
    thisPerson: {real: false, action: "To Disappear", hopeful_about: "everything"}, 
    notActuallyAPerson: "I'm not a person!"
  }; 
  return JSON.stringify(value, null, '\t'); 
}

function functionify() {
  var value = ["freddy kruger", "gouda", "the fold", "America"];
  return JSON.stringify(value); 
}


http.createServer(function(req, res) {
  if (req.url == "/names") {
    var namesJSON = functionify(); 
    res.end(namesJSON);
  } else if (req.url == "/people") {
    var peopleWithAttributesJSON = peopleWithAttributes(); 
    res.end(peopleWithAttributesJSON);  
  } else
    res.end("<h1>40404040404</h1>");
}).listen(2000);