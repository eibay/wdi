var IndexView = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html('<h1>Movies, Books, Hello, or Kittens?</h1>');
  }
});

var MoviesView = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html()
  }
});

var MovieView = Backbone.View.extend({
  initialize: function(){
    // ***** do i make the ajax call here or in the route? 
    this.render();
  },
    // ***** i just made up how to use this attribute 
  render: function(){
    name = this.moviename;
    this.$el.html(name)
  }
});

var BooksView = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html('<h2>Books</h2><ul><li>The Orphan Masters Son</li><li>Crime and Punishment</li><li>American Pastoral</li><li>Let the Great World Spin</li><li>Angle of Repose</li></ul>');
  }
});

var HelloView = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html();
  }
});

var KittensView = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html();
  }
});



$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
      "": "index",
      "movies": "movies",
      "movie/:moviename": "movie",
      "books": "books",
      "hello/:name": "hello",
      ":width/:height": "kittens",
    }
  });

  var router = new AppRouter;

  router.on('route:index', function(){
    var mainContent = $('#main-content');
    var indexView = new IndexView({el: mainContent});
  });
// ***** how do i URI the movie name for the url? 
  router.on('route:movies', function(){
    var mainContent = $('#main-content');
    var moviesView = new MoviesView({el: mainContent});
    mainContent.html('<h2>Movies</h2><ul><li><a href="#movies/dogdayafternoon">Dog Day Afternoon</a></li><li>This Is Spinal Tap</li><li>Breakfast at Tiffany</li><li>The Killing of a Chinese Bookie</li><li>The Honeymoon Killers</li></ul>');
  });
// ***** this route thinks it's kittens
  router.on('route:movie', function(moviename){
    var mainContent = $('#main-content');
    var movieView = new MovieView({el: mainContent, moviename: moviename});
    mainContent.html('<h2>there will be movie info from omdb ajax call</h2>' + moviename);
  });

  router.on('route:books', function(){
    var mainContent = $('#main-content');
    var booksView = new BooksView({el: mainContent});
  });

  router.on('route:hello', function(name){
    var mainContent = $('#main-content');
    var helloView = new HelloView({el: mainContent});
    mainContent.html('<h1>Hello, ' + name + '</h1>');
  });

  router.on('route:kittens', function(width, height){
    var mainContent = $('#main-content');
    var kittyView = new KittensView({el: mainContent});
    mainContent.html('<h3>yes, kittens</h3><img src="http://placekitten.com/g/' + width + '/' + height + '">');
  });

  




// needed
  Backbone.history.start();


});

