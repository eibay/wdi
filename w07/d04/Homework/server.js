var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');


var server = http.createServer();

 
server.on('request', function(request, response) {

  var parsedRequest = url.parse(request.url, true);

  console.log("Request received to: " + parsedRequest.pathname)

  if (parsedRequest.pathname == '/') {

    console.log('index.html has been loaded');
    response.end(fs.readFileSync('./index.html'));

  } else if (parsedRequest.pathname.split('?')[0] == '/term') {

    console.log('term has been loaded');
    var term = parsedRequest.query.specific_term;
    var images = httpClient.get('https://api.instagram.com/v1/tags/' + term + '/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b', function(err, res2, body) {
      console.log('HTTParty yahooo!');
      response.end(body);
    });

  } else if (parsedRequest.pathname.split('?')[0] == '/location') {

    console.log('location has been loaded');
    var lat = parsedRequest.query.lat;
    var lng = parsedRequest.query.lng;
    var images = httpClient.get('https://api.instagram.com/v1/media/search?lat=' + lat + '&lng=' + lng + '&client_id=40eb15cb18e94f7db90a3ee37208f21b', function(err, res2, body) {
      console.log('HTTParty yahooo!');
      response.end(body);
    });

  }
});

server.listen(2000);