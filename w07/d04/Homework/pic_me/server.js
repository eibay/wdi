var http = require('http');
var request = require('request');
var fs = require('fs');

// var url = require('url');

var server = http.createServer(function(req,res) {
	var path = req.url

	if(path == '/') {
		var html = fs.readFileSync('./index.html');
		console.log('made it!')
		res.end(html);
	} else if(path.split('?')[0] == '/photos') {
		var loc = path.split('=')[1];
		console.log('made it!')
		// var loc = request.params['loc'].split(' ').join('+')
		var googloc = request('http://maps.googleapis.com/maps/api/geocode/json?address=' + loc, function(err, res2, body) {
		});
		
		// var lat = googloc['results'][0]['geometry']['location']['lat']; 
		// var lng = googloc['results'][0]['geometry']['location']['lng']; 

		request('https://api.instagram.com/v1/media/search?lat=40.739446&lng=-73.8333651&client_id=6e4453d0a1e84159a1b28c13d09916cb', function(err, res2, body) {
			res.end(body);
		});
		// var photos = request('https://api.instagram.com/v1/media/search?lat=' + lat + '&lng=' + lng + '&client_id=6e4453d0a1e84159a1b28c13d09916cb', function(err, res2, body) {
		// });
	}
});

server.listen(2000);



