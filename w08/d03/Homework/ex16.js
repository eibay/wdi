var http = require('http');
var Router = require('node-simple-router');
var router = new Router();  

/* functions */ 

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

/* routes */

router.get("/names", function(req, res) {
  res.end(functionify()); 
});

router.get("/people", function(req, res) {
  res.end(peopleWithAttributes()); 
});

/* server */

var s = http.createServer(router);
s.listen(2000); 