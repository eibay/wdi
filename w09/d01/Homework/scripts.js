// var uri = require('uri');

// views
var IndexView = Backbone.View.extend ({
	initialize: function(){
		this.render();	
	},
	render: function(){
	$("ul").html('');	
		var header = $('header');
		header.html('<h2> Welcome Page </h2>');
		console.log("index.page has been viewed");
	}
});

var MovieView = Backbone.View.extend ({
	initialize: function(){
		this.render();	
	},
	render: function(){
	$("ul").html('');	
	var favorite_movies = ['Rocky IV', 'Independence Day', 'Catch Me If You Can'];

		var header = $('header');
		header.html('<h2> Movie Page </h2>');

		_.each(favorite_movies, function(movie){

			var listItem = $('li');
			listItem.text = movie;
			$('ul').append('<li>'+movie+'</li>');


		})
		console.log("movie.page has been viewed");
	}
});

var BooksView = Backbone.View.extend ({
	initialize: function(){
		this.render();	
	},
	render: function(){
	$("ul").html('');	
	var favorite_books = ['Of Mice and Men', 'Catcher and the Rye', 'The Great Gastby'];

		var header = $('header');
		header.html('<h2> Books Page </h2>');

		_.each(favorite_books, function(book){

			var listItem = $('li');
			listItem.text = book;
			$('ul').append('<li>'+book+'</li>');


		})
		console.log("books.page has been viewed");
	}
});

var HelloView = Backbone.View.extend ({
	initialize: function(){
		this.render();	
	},
	render: function(){
	$("ul").html('');	
		var header = $('header');
		// header.html('<h3>Hello' + name + '!</h3>');
		console.log("hello.page has been viewed");
	}
});

var CageView = Backbone.View.extend ({
	initialize: function(){
		this.render();	
	},
	render: function(){
	$("ul").html('');	
		var header = $('header');
		console.log("cage.page has been viewed");
	}
});

var IndividualMovie = Backbone.View.extend({
	initialize:function(options){
		this.render(JSON.parse(data))
		},
	render: function(hash){
		$("ul").html('');	
		header.html('<h1>'+hash["Title"]+'</h1><h2>Year:'+hash["Year"]+'</h2><img src="'+hash["Poster"]+'">');
	}		
});

// router
$(function(){

	var AppRouter = Backbone.Router.extend ({
		routes: {
			"": "index",
			"movies": "movies",
			"books": "books",
			"hello/:name": "hello",
			"c/:width/:length": "cage",
			"movie/:moviename": "movie"

		}
	});

	var router = new AppRouter;

	router.on('route:index', function(){
		var header = $('header');
		var index_view = new IndexView();
		console.log("testing index");
	});

	router.on('route:movies', function(){
		var header = $('header');
		var movie_view = new MovieView();
		console.log("testing movies");
	});

	router.on('route:books', function(){
		var header = $('header');
		var books_view = new BooksView();
		console.log("testing books");
	});

	router.on('route:hello', function(name){
		var header = $('header');
		header.html('<h3>Hello '  +name+ '!</h3>');
		// var hello_view = new HelloView();
		console.log("testing hello/NAME");
	});

	router.on('route:cage', function(width, length){
		var header = $('header');
		header.html('<img src="http://www.placecage.com/c/'+width+'/'+length+'">')
		console.log("testing cage");
	});

	// not working
	router.on('route:movie', function(moviename){
		$.get('http://www.omdbapi.com/?t='+movie, function(data){
		var individual_movie_view= new IndividualMovie({data: data})
		console.log("testing cage");
		})
	});		

	  Backbone.history.start();

});


