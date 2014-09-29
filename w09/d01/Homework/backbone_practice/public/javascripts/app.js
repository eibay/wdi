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
    this.$el.html('<h2>Movies</h2><ul><li>Dog Day Afternoon</li><li>This Is Spinal Tap</li><li>Breakfast at Tiffany</li><li>The Killing of a Chinese Bookie</li><li>The Honeymoon Killers</li></ul>')
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
    this.$el.html('<h1>Hello, name</h1>');
  }
});

// var KittensView = Backbone.View.extend({
//   initialize: function(){
//     this.render();
//   },
//   render: function(){
//     this.$el.html(<h1>'Kittens'</h1>);
//   }
// });

$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
      "": "index",
      "movies": "movies",
      "books": "books",
      "hello": "hello",
    }
  });

  var router = new AppRouter;

  router.on('route:index', function(){
    var h1 = $('h1');
    var indexView = new IndexView({el: h1});
  });

  router.on('route:movies', function(){
    var h1 = $('h1');
    var moviesView = new MoviesView({el: h1});
  });

  router.on('route:books', function(){
    var h1 = $('h1');
    var booksView = new BooksView({el: h1});
  });

  router.on('route:hello', function(){
    var h1 = $('h1');
    var helloView = new HelloView({el: h1});
  });













// needed
  Backbone.history.start();


});

