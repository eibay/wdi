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

http.createServer(function(req, res) {
  var peopleWithAttributesJSON = peopleWithAttributes(); 
  res.end(peopleWithAttributesJSON);  
}).listen(2000);