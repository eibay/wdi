#!/usr/bin/env node
args = process.argv

var request = require('request');


var movie = args[2]


request('http://api.themoviedb.org/3/search/movie?api_key=d57af5ae990a1ed5505b70039114fa04&query='+encodeURIComponent(movie), function (error, response, body) {
	var movie = JSON.parse(body)
	var title =movie.results[0].original_title
	var year = movie.results[0].release_date.slice(0,4)
	var poster = 'http://image.tmdb.org/t/p/w185/'+movie.results[0].poster_path
	var hash = {title:title, year:year, poster_url: poster}
	request({
		url:'http://localhost:3000/movies',
		method: 'POST',
		form: hash
	}, function (err, res, bod) {
		if (!err && res.statusCode == 200) {
			console.log(bod);
		}
	});


})