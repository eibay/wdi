var HelloView = Backbone.View.extend({
  initialize: function(){
    console.log("A new Name view has been made");
    this.render();
  },
  render: function(){
    console.log(this.$el)
    var main = $('#main');
    main.html("<h2>Hello, " + this.$el.selector + "</h2>");
  }
});

var MovieView = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){
    //A lot of movies don't work correctly, sadly
    var movArr = ["Inception", "Jaws", "Army of Darkness"];
    var ul = this.$el.html('<ul></ul>');
    _.each(movArr, function(movie){
      var mainUl = this.$el
      ul.append('<li><a href="#/movies/' + movie.split(' ').join('') + '">' + movie + '</a></li>');
    })
  }
})

var BookView = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){

  }
})

var OneMovieView = Backbone.View.extend({
  initialize: function(){
    this.render();
  }
})



$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index",
    	"movies": "movies",
      "movies/:title": "oneMovie",
      "books" : "books",
      "hello/:name": "hi",
      ":width/:height": "kittens"

    }
  });

  var router = new AppRouter;

  router.on('route:hi', function(){
    var name = window.location.hash.split("/")[2];
    var hello = new HelloView({el: name});
  });

  router.on('route:kittens', function(width, height){
    var main = $('#main');
    var image = "<img src='http://placekitten.com/g/" + width + "/" + height + "'>"
    main.html(image)
  })

  router.on('route:movies', function(){
    var main = $('#main')
    var movieView = new MovieView({el: main});
  });

  router.on('route:oneMovie', function(title){
    $.get("http://www.omdbapi.com/?t=" + title, function(data){
      var movie = $.parseJSON(data)
      var main = $('#main')
      var movieInfo = "<p>" + movie['Title'] + " was released in " + movie['Year'] + ". It's poster looked thusly:</p></br><img src='" + movie['Poster'] + "'>"
      main.html(movieInfo)

      var oneMovieView = new OneMovieView()
    })
  });

  router.on('route:books', function(){
    var bookArr = ["My Ishmael", "A Short History of Nearly Everything"]
    var main = $('main')
    var ul = main.html('<ul></ul>');
    _.each(bookArr, function(book){
      console.log(book)
      $.get("http://localhost:4567/" + book, function(data){
        var book = $.parseJSON(data)
        debugger

      })    
    })
  })


  Backbone.history.start();
});