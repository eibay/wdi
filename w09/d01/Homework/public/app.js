var IndexView = Backbone.View.extend({
  initialize: function(){
  }
 })
var AddView = Backbone.View.extend({
  initialize: function(book){
    this.render(book)
  },
  render: function(){
    $(".list").html("<li><a href='#/movie/titanic'>Titanic</li><li><a href='#/movie/the%20help'>The Help</li><li><a href='#/movie/scarface'>Scarface</li>")
    
  }
})

var MoviesView = Backbone.View.extend({
  initialize: function(){
    this.render()
  },
  render: function(){
    $(".list").html("<li><a href='#/movie/titanic'>Titanic</li><li><a href='#/movie/the%20help'>The Help</li><li><a href='#/movie/scarface'>Scarface</li>")
    
  }
})

var HelloView = Backbone.View.extend({
  initialize: function(name){
    this.render(name)
  },
  render: function(name){
    $("div").html("<h1> HELLO "+name.toUpperCase()+"</h1>")
    
  }
})
var BookView = Backbone.View.extend({
  initialize: function(bookname){
    this.render(bookname)
  },
  render: function(bookname){
    $.get("/booknamestuff/"+bookname, function(bookinformation){
      book = JSON.parse(bookinformation)
      // book.GoodreadsResponse.book.average_rating
      $(".list").text("Rating of "+ book.GoodreadsResponse.book.average_rating)
    })

    
  }
})

var BooksView = Backbone.View.extend({
  initialize: function(books){
    this.render(books)
  },
  render: function(books){
    $(".list").html("<li> <a href='#/book/charlottes%20web'>Charlottes Web</a></li>")
    $(".list").append("<input name='name' placeholder='adding book'></input><button class='add'>ADD</button>")
    $(".add").click(function(event){
      var book = (this.parentNode.children[1].value)
      console.log(book)
      var bookname = encodeURI(this.parentNode.children[1].value)
    $(".list").append("<li> <a href=#/book/"+bookname+">"+book+"</a>"+"</li>")
    })
  }
})
var MovieView = Backbone.View.extend({
  initialize: function(moviename){
    this.render(moviename)
  },
  render: function(name){
    $.get("http://omdbapi.com/?t="+name, function(movie){
      movie = JSON.parse(movie)
      $(".list").html(movie.Title+" " + movie.Year+"<img src="+movie.Poster+ " " +"height='100' width='100'>")
      console.log(movie.Poster)
    })

  }
})


$(function(){
  var AppRouter = Backbone.Router.extend({
    routes:{
      "":"index",
      "movies":"movies",
      "movie/:moviename":"movie",
      "books":"books",
      "book/:bookname":"book",
      "hello/:name":"hello",
      "add/:book":"books"
    }
  });



  var router = new AppRouter;
  router.on('route:index', function(){
    var indexView = new IndexView()
  })



 router.on('route:book', function(bookname){
    var bookView = new BookView(bookname)
  })

 router.on('route:movies', function(){
  console.log("hey")
    var moviesView = new MoviesView()
  })

 router.on('route:books', function(book){
    var booksView = new BooksView(book)
  })
 router.on('route:hello', function(name){
    var helloView = new HelloView(name)
  })

router.on('route:movie', function(moviename){
  console.log("movie")
    var movieView = new MovieView(moviename)
  })
Backbone.history.start();


})