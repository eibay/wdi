var favMovies = ['The Lord of the Rings', 'Jaws', 'Inception', 'The Departed']

var MainView = Backbone.View.extend({
	initialize: function(){
		console.log('main connected')
		this.render();
	},
	render: function() {
		this.$el.html('<h2>Main Page</h2>')
	},
});

var MovieView = Backbone.View.extend({
	initialize: function(){
		console.log('movies connected')
		this.render();
	},
	render: function() {
		$('ul').html('')
		$('#subheader').html('<h2>Movie Page</h2>');
		$('.list-title').text('Favorite Movies');

		_.each(favMovies, function(movie) {
			var listItem = ('<li><a href=#movies/' + movie + '>'+ movie + '</a></li>')
			$('ul').append(listItem);
		});
	}
});

var BookView = Backbone.View.extend({
	initialize: function(){
		console.log('books connected')
		this.render();
	},
	render: function() {
		$('ul').html('')
		$('#subheader').html('<h2>Book Page</h2>');
		$('.list-title').text('Favorite Books');
	}
})

$(function(){

	var AppRouter = Backbone.Router.extend({
		routes: {
			'': 'main',
			'movies': 'movies',
			'books': 'books',
			'hello/:name': 'hello',
			'sheen/:width/:height': 'sheen',
			'movies/:moviename': 'movie'
		}
	});

	var appRouter = new AppRouter;

	appRouter.on('route:main', function() {
		var header = $('#subheader');
		var mainView = new MainView({el: header});
	});

	appRouter.on('route:movies', function() {
		var header = $('#subheader');
		var movieView = new MovieView({el: header});
	});

	appRouter.on('route:books', function() {
		var header = $('#subheader');
		var bookView = new BookView({el: header});
	});

	appRouter.on('route:hello', function(name) {
		$('.container').html('<h1>Hello ' + name + '</h1>')
	});

	appRouter.on('route:sheen', function(width, height) {
		$('.container').html('');
		$.get('http://placesheen.com/' + width + '/' + height, function(image) {
			$('body').append('<img src="' + image + '">')
		})

	})

	appRouter.on('route:movie', function(movieName) {
		console.log('connected')
		$('ul').html('');
		$.get('http://www.omdbapi.com/?t=' + movieName, function(data){
			
			var parsedRes = (JSON.parse(data));
			$('ul').html('<h3>'+parsedRes['Title']+'</h3><h3>'+parsedRes['Year']+'</h3><img src="'+parsedRes['Poster']+'">');
		});
	});

	Backbone.history.start();
})








