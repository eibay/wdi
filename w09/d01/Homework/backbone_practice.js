var MoviesView = Backbone.View.extend({
	initialize: function(){
		console.log("Movies view has been created");
		this.render()
	},
	render: function(){
		var header = $('header')
		this.$el.html("<h2>Favorite Movies </h2>");
	}
});

var BooksView = Backbone.View.extend({
	initialize: function(){
		console.log("Books view was created")
		this.render()
	},
	render: function(){
		var header = $('header')
		this.$el.html("<h2> Favorite Books </h2>")
	}
})


$(function(){
	var AppRouter = Backbone.Router.extend({
		routes:{
			"movies":"movies"
			"books":"books"
		}
	});

	var router = new AppRouter;

	router.on('route:movies', function(){
		var moviesView = new MoviesView({el: header})
		console.log("Hit movies route")
	})

	router.on('route: books', function(){
		var booksView = new BooksView({el: header})
		console.log("Hit books route")
	})

	Backbone.history.start();
})