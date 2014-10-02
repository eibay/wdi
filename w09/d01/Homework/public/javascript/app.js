var MoviesView = Backbone.View.extend({
	initialize: function(){
		this.render()
		console.log("A new Movies view has been created");
	},
		render: function(){
		this.$el.html("<h2>Favorite Movies</h2><ol><li><a href='#/movie/Star Wars'>Star Wars</a></li> <li><a href='#/movie/Raiders of the Lost Ark'>Raiders of the Lost Ark</a></li> <li><a href='#/movie/To Kill a Mockingbird'>To Kill a Mockingbird</a></li> <li><a href='#/movie/Life of Brian'>Life of Brian</a></li> <li><a href='#/movie/Heathers'>Heathers</a></li> <li><a href='#/movie/Kill Bill'>Kill Bill</a></li> <li><a href='#/movie/Time Bandits'>Time Bandits</a></li> <li><a href='#/movie/The Neverending Story'>The Neverending Story</a></li> <li><a href='#/movie/Trainspotting'>Trainspotting</a></li> <li><a href='#/movie/Election'>Election</a></li></ol>");
	}
});

var MovieView = Backbone.View.extend({
	initialize: function(movie){
		this.render(movie)
		console.log("A new Movie view has been created");
	},
	render: function(movie){
		 $.get("http://omdbapi.com/?t="+movie, function(movie){
      movie = JSON.parse(movie)
      console.log(movie)
      $("header").html("<h2>Details for " + movie.Title + "</h2><b>Title: </b>" + movie.Title + "<br><b>Year:</b> " + movie.Year + "<br> <img src="+movie.Poster+">");
    })
	}
});

var BooksView = Backbone.View.extend({
	initialize: function(){
		this.render()
		console.log("A new Books view has been created");
	},
			render: function(){
		this.$el.html("<h2>Favorite Books</h2><ol><li>Me Talk Pretty One Day</li> <li>Cruddy</li> <li>To Kill a Mockingbird</li> <li>A Tree Grows in Brooklyn</li> <li>The Chocolate War</li> <li>Blubber</li> <li>Running With Scissors</li> <li>Postcards from the Edge</li> <li>Portnoy's Complaint</li> <li>The Catcher in the Rye</li></ol>");
	}
});

var HelloView = Backbone.View.extend({
	initialize: function(name){
		this.render(name)
		console.log("A new Hello view has been created");
	},
	render: function(name){
		$("header").html("<h2>Hello, " + name.toUpperCase() + "</h2>");
	}
});

// var ImageView = Backbone.View.extend({
// 	initialize: function(){
// 		this.render()
// 		console.log("A new Image view has been created");
// 	},
// 	render: function(){
// 		this.$el.html(image);
// 	}
// });

$(function(){

var AppRouter = Backbone.Router.extend({
	routes: {
		"movies": "movies",
		"movie/:movie": "movie",
		"books": "books",
		"hello/:name": "hello",
		":width/:height": "images"
	}
});

var router = new AppRouter;

router.on('route:movies', function(){
	var header = $('header');
	var moviesView = new MoviesView({el: header});
});

router.on('route:movie', function(movie){
	var header = $('header');
	var movieView = new MovieView(movie);
});

router.on('route:books', function(){
	var header = $('header');
	var booksView = new BooksView({el: header});	
});

router.on('route:hello', function(name){
	var header = $('header');
	var helloView = new HelloView(name);
});

router.on('route:images', function(width, height){
	var img = $('.image');
	var image = "<img src='http://placekitten.com/g/" + width + "/" + height + "'>"
	img.html(image);
});

	Backbone.history.start();
	
});