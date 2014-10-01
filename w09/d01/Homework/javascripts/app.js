

var IndexView = Backbone.View.extend({
	initialize: function(){
		console.log("Index, yo!");
		this.render();
	},
	render: function(){
		$('ul').html('');
		this.$el.text('INDEX ARGH');
		return this;
	}
})
var CageView = Backbone.View.extend({
	initialize: function(){
		console.log("But how'd it get burned??!");
		this.render();
	},
	render: function(){
		$('ul').html('');

		return this;
	}
})
var MovieView = Backbone.View.extend({
	initialize: function(){
		console.log(' a new instance of MovieView has been created');
		this.render();
	},
	render: function(){
		// $('ul').html('');
		var title = $('h1');
		title.text("MOVIES!");

		var favMovies = ["Inception", "Ip Man", "The Prestige", "Dark Knight"];
		
		_.each(favMovies, function(movie){

			$('ul').append('<li>'+ '<a href="movies_specific' + movie + '">' + movie + '</a>' + '</li>');
		});
		return this;	
	}
});

var MovieShow = Backbone.View.extend({
	initialize: function(){
		this.render();
	},
	render: function(){
		$('ul').html('');

		var xhr = new XMLHttpRequest();

		xhr.addEventListener('load', function(){
			
		})

		xhr.open('GET', 'http://www.omdbapi.com/?t=' + movie, true);
		xhr.send();


		this.$el
	}
})

var BookView = Backbone.View.extend({
	initialize: function(){
		console.log(' books for you!');
		this.render();
	},
	render: function(){
		$('ul').html('');
		this.$el.text('Book Page');
		return this;
	}
});

var HelloView = Backbone.View.extend({
	initialize: function(){
		console.log('hello!')
		this.render();
	},
	render: function(){
		$('ul').html('');
		this.$el.text('Hello!');
		return this;
	}
})




$(function(){

	var AppRouter = Backbone.Router.extend({
		routes: {
			"": "index",
			"movies": "movies",
			"books": "books",
			"hello/NAME": "hello/NAME",
			"c/:width/:length": "nicCage",
			"movies_specific": 'movies_specific'
		}
	})
	var appRouter = new AppRouter;

	

	appRouter.on('route:index', function(){
		console.log("index");
		var title = $('h1');
		var indexView = new IndexView({el: title});
	});

	appRouter.on('route:nicCage', function(width, length){
		console.log('nic cage');
		var cageView = new CageView;
		$('ul').html('<img src="http://www.placecage.com/c/'+width+'/'+length+'">');

	});

	appRouter.on('route:movies', function(){
		console.log('movies');
		var movieView = new MovieView;
		
	});

	appRouter.on('route:movies_specific', function(){
		console.log('movies_specific');
		var movieShow = new MovieShow;
	})

	appRouter.on('route:books', function(){
		console.log('books');
		var title = $('h1');
		var bookView = new BookView({el: title});
	});

	appRouter.on('route:hello/NAME', function(){
		console.log('hello NAME');
		var title = $('h1');
		var helloView = new HelloView({el: title});
	});

	Backbone.history.start();

});