var http = require('http');
var url = require('url');
var request = require('request');
var fs = require('fs');

var server = http.createServer(handleRequest);
server.listen(2000);


function handleRequest(req, response) {
  console.log(req.url)
  if (req.url == "/") {
    response.end(fs.readFileSync("./index.html"));
  } else if (req.url == "/client.js") {
    response.end(fs.readFileSync("./client.js"));
  } else if (req.url == "/favicon.ico") {
    response.end(fs.readFileSync("./favicon.ico"));
  } else if (req.url.split('?')[0] == "/city") {
    var parsedRequest = url.parse(req.url, true);
    var city = parsedRequest.query.city;

    geoCode(city, function(loc) {
      instagram(loc, function(imgs) {
        response.end(JSON.stringify(imgs));
      })
    })
  } else {
    response.end("bad request");
  }
}

function geoCode(city, callback){
  var gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address="
    + city + "&key=AIzaSyBdcPMR6ZpFd7q-bh9oZo30YK0peT8CkGc";

  request(gmaps_url, function (err, res, body) {
    var json = JSON.parse(body);
    var loc = json.results[0].geometry.location

    callback(loc);
  })
}

function instagram(loc, callback) {
  var client_id = "cacf552d16c24fd6b86a67aa4afe2ef0";
  var instagram_url = 'https://api.instagram.com/v1/media/search?lat='
    + loc.lat + '&lng=' + loc.lng + '&client_id=' + client_id;

  request(instagram_url, function (err, res, body) {
    var json = JSON.parse(body);
    var imageArray = [];

    //loop through the json data and one by one add
    //an image url to our variable imageArray
    for(var i=0; i< json.data.length; i++) {
      var img_url = json.data[i].images.standard_resolution.url;
      imageArray.push(img_url);
    }

    callback(imageArray);
  });
}
