var MovieView = Backbone.View.extend({
	initialize: function(){
		console.log('New Movie view created');
		this.render();
	},

	render: function(){
		this.$el.html('<h3>My Favorite Movies</h3><ul><li>Only Lovers Left Alive</li><li>Inception</li><li>Prometheus</li></ul>');
	}
})

var BookView = Backbone.View.extend({
	initialize: function(){
		console.log('New Book view created');
		this.render();
	},

	render: function(){
		this.$el.html('<h3>My Favorite Books</h3><ul><li>Zen and the Art of Motorcycle Maintenance</li><li>Bleeding Edge</li><li>Ubik</li></ul>')
	}
})

$(function(){
	var AppRouter = Backbone.Router.extend({
		routes: {
			'movies': 'movies',
			'books': 'books',
			'hello/:name': 'hello',
			'kitty/:w/:h': 'kitty'
		}
	});

	var router = new AppRouter;

	router.on('route:movies', function(){
		var header = $('header');
		var movieView = new MovieView({el: header});
	});

	router.on('route:books', function(){
		var header = $('header');
		var bookView = new BookView({el: header});
	});

	router.on('route:hello', function(name){
		var header = $('header');
		header.html('<h3>Hello ' + name + '!</h3>')
	});

	router.on('route:kitty', function(w, h){
		var header = $('header');
		header.html('<img src="http://placekitten.com/g/' + w + '/' + h + '\">');
	});

	Backbone.history.start();

});