var MovieView = Backbone.View.extend({
	initialize: function(){
		console.log('New Movie view created');
		this.render();
	},

	render: function(){
		var myFavMovies = ['Only Lovers Left Alive', 'Inception', 'Prometheus'];

		this.$el.html('<h3>My Favorite Movies</h3><ul></ul>');
		_.each(myFavMovies, function(movie){
			$('ul').append('<li><a href="#/movies/' + movie + '\">' + movie + '</a></li>');
		})
	}
})

var BookView = Backbone.View.extend({
	initialize: function(){
		console.log('New Book view created');
		this.render();
	},

	render: function(){
		var myFavBooks = ['Zen and the Art of Motorcycle Maintenance', 'Ubik', 'Bleeding Edge'];

		this.$el.html('<h3>My Favorite Books</h3><ul></ul><input type="');
		_.each(myFavBooks, function(book){
			$('ul').append('<li>' + book + '</li>');
		})
	}
})

var MovieTitle = Backbone.View.extend({
	initialize: function(){
		this.render();
	}
})

$(function(){
	var AppRouter = Backbone.Router.extend({
		routes: {
			'movies': 'movies',
			'books': 'books',
			'hello/:name': 'hello',
			'kitty/:w/:h': 'kitty',
			'movies/:title': 'movies/title'
		}
	});

	var router = new AppRouter;
	var header = $('header');

	router.on('route:movies', function(){
		var movieView = new MovieView({el: header});
	});

	router.on('route:books', function(){
		var bookView = new BookView({el: header});
	});

	router.on('route:hello', function(name){
		header.html('<h3>Hello ' + name + '!</h3>')
	});

	router.on('route:kitty', function(w, h){
		header.html('<img src="http://placekitten.com/g/' + w + '/' + h + '\">');
	});

	router.on('route:movies/title', function(title){
		$.get('http://www.omdbapi.com/?t=' + title, function(data){
			movie = $.parseJSON(data);
		header.html('<h3>' + title + ' (' + movie['Year'] + ')</h3><img src=\"' + movie['Poster'] + '\">')
		});
	})

	Backbone.history.start();

});