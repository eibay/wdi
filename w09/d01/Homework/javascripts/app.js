var MovieView = Backbone.View.extend({
    initialize: function() {
        this.render();
    },
    render: function() {
     this.$el.html("<h2>My fav movie is Fight Club</h2>")
    }
  });

var BookView = Backbone.View.extend({
  initialize: function() {
    this.render();
  },
  render: function() {
    this.$el.html("<h2>My fav book is the back of a cereal box</h2>")
  }
});

var Greeting = Backbone.View.extend({
  initialize: function() {
    this.render();
  },
  render: function() {
    this.$el.html("<button>Hello Tim</button>")
  }
});


$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
      "movies" : "movies",
      "books" : "books",
      "/hello/:name" : "greeting"
    }
  });

  var router = new AppRouter;

  router.on('route:movies', function() {
    var header = $('header');
    var movieView = new MovieView({el: header});
  });

  router.on('route:books', function() {
    var header = $('header');
    var bookView = new BookView({el: header});
  });

  router.on('route:greeting', function() {
    var button = $('button');
    var greeting = new Greeting({el: button});
  });

  Backbone.history.start();

});