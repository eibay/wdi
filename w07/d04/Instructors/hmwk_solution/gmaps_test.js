var request = require('request');

//this has my API key ... don't take it!
var url = "https://maps.googleapis.com/maps/api/geocode/json?address=Mountain+View,+CA&key=AIzaSyBdcPMR6ZpFd7q-bh9oZo30YK0peT8CkGc";

request(url, function (error, response, body) {
  //first off, the response is a string and not yet
  //a javascript object. so lets json it
  var json = JSON.parse(body);
  //finding the data in the response wasn't an easy task
  //I first went to the url (up above in the url variable) in the browser
  //to visualize it, then figured out specifically how to
  //dig into the data in the node debugger
  var loc = json.results[0].geometry.location
  //got it! if we were in a server right now we would just
  //jsonify loc and send it back to the browser
  console.log("lat is " + loc["lat"])
  console.log("lng is " + loc["lng"])
})
