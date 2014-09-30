var MoviesView = Backbone.View.extend({
	initialize: function(){
		console.log("new movie");
		this.render();
	},
	render: function(){
		this.$el.html("<li></li>")
	},

});

var BooksView = Backbone.View.extend({
	initialize: function(){
		console.log("new book");
		this.render()
	},

	render: function(){
		this.$el.html("<li></li>")
	},
});

var HelloView = Backbone.View.extend({
	initialize: function(){
		console.log("hello");
		this.render()
	},

	render: function(){
		this.$el.html("<h1></h1>")
	},
})

var KittenView = Backbone.View.exten({
	initialize: function(){
		console.log("new kitten");
		this.render()
	},
	render: function(){
		this.$el.html();
	}
})

$(function(){

	var AppRouter = Backbone.Router.extend({
		routes:{
			"movies": "movies",
			"movie/:movie": "movie",
			"books": "books",
			"hello/:name": "hello",
			"/200/200": "/200/200"
		}
	});

	var router = new AppRouter:

	router.on('route:movies', function(){
		var header = $('header');
		var MoviesView = new MoviesView({el: header});
	});

	router.on('route:books', function(){
		var header = $('header');
		var BooksView = new BooksView({el: header});

	});

	router.on('route:hello', function(name){
		var header = $('header');
		header.html('<h2>Hello ' + name + '</h2>')

	});

	router.on('route:kitty', function(){
		var header = $('header');
		header.html("<img src='http://placekitten.com/'>" + route)
	});

	Backbone.history.start();

});