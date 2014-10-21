var arg = process.argv[2]

var request = require('request');

request({
	method: 'GET',
	url: 'http://api.themoviedb.org/3/search/movie?api_key=2d36d580824c3d93bcbca85b0ff7cf7b&query=' + encodeURIComponent(arg),
	headers: {
		'Accept': 'application/json'
	}}, function (error, response, body) {
		var movieParsed = JSON.parse(body);
		var movie = {};
		movie.tmdb_id = movieParsed['results'][0]['id'];
		movie.title = movieParsed['results'][0]['original_title'];
		movie.year = movieParsed['results'][0]['release_date'].split('-')[0]
		movie.poster = 'https://image.tmdb.org/t/p/w185' + movieParsed['results'][0]['poster_path']
		console.log(movie)
		
		request({
			method: 'GET',
			url: 'http://api.themoviedb.org/3/movie/' + movie.tmdb_id + '/credits?api_key=2d36d580824c3d93bcbca85b0ff7cf7b',
			headers: {
				'Accept': 'application/json'
			}}, function (error, response, body) {
				var castParsed = JSON.parse(body);
				var cast = [];
				cast.push({character: castParsed['cast'][0]['character'], actor: castParsed['cast'][0]['name'], pic: 'https://image.tmdb.org/t/p/w185/' + castParsed['cast'][0]['profile_path']});
				console.log(cast);

				request({
					method: 'POST',
					url: 'http://localhost:3000/movies.json',
					body: JSON.stringify([{
						title: movie.title, 
						year: movie.year,
						poster_url: movie.poster
					}])}, function(error, response, body){
						var parsedResponse = JSON.parse(body)
						var movie_id = parsedResponse['id']
							console.log(movie_id)
						}

					// request({
					// 	method: 'POST',
					// 	url: 'http://localhost:3000/actors.json',
					// 	body: JSON.stringify({
					// 		fname: cast.actor.split(' ')[0],
					// 		lname: cast.actor.split(' ')[1],
					// 		picture_url: cast.pic
					// 	});

					// 	request({
					// 		method: 'POST',
					// 		url: 'http://localhost:3000/roles.json',
					// 		body: JSON.stringify({
					// 			character_name: cast.character,
					// 			movie_id:
					// 		});
					// 	});

					// });
				// });
				) 
			});
	});


//search movie
// request({
//   method: 'GET',
//   url: 'http://api.themoviedb.org/3/search/movie',
//   headers: {
//     'Accept': 'application/json'
//   }}, function (error, response, body) {
//   console.log('Status:', response.statusCode);
//   console.log('Headers:', JSON.stringify(response.headers));
//   console.log('Response:', body);
// });

// //search cast
// request({
//   method: 'GET',
//   url: 'http://api.themoviedb.org/3/movie/{id}/credits',
//   headers: {
//     'Accept': 'application/json'
//   }}, function (error, response, body) {
//   console.log('Status:', response.statusCode);
//   console.log('Headers:', JSON.stringify(response.headers));
//   console.log('Response:', body);
// });

// function movie_add(){

// }