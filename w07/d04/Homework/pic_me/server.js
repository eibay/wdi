var http = require('http');
var request = require('request');
var fs = require('fs');
var httpAdapter = 'http';
var geocoderProvider = 'google';
var geocoder = require('node-geocoder').getGeocoder(geocoderProvider, httpAdapter);

var server = http.createServer(function(req,res) {
	var path = req.url

	if(path == '/') {
		var html = fs.readFileSync('./index.html');
		console.log('made it!')
		res.end(html);
	} else if(path.split('?')[0] == '/photos') {
		var loc = path.split('=')[1];
		console.log('made it!')

		geocoder.geocode(loc, function(err, geores) {
			var lat = geores[0]['latitude'];
			var lng = geores[0]['longitude']
			request('https://api.instagram.com/v1/media/search?lat=' + lat + '&lng=' + lng + '&client_id=6e4453d0a1e84159a1b28c13d09916cb', function(err, instares, body) {
			res.end(body);
			});
		});
	}
});

server.listen(2000);



