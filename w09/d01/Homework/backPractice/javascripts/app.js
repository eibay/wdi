
// below is a hash?
  var MoviesView = Backbone.View.extend({
    initialize: function(){
      console.log("A new movies view has been created!");
    },
    render: function(){
      var header = $("header");
      header.html("<ul><li>The Shawshank Redemption</li><li>The Godfather</li><li>The Godfather: Part II</li><li>The Dark Knight</li><li>Pulp Fictionn</li></ul>");
    }
  });

  var BooksView = Backbone.View.extend({
    initialize: function(){
      console.log("A new books view has been created!");
    },
    render: function(){
      var header = $("header");
      header.html("<ul><li>Into the Wild</li><li>Into Thin Air</li><li>Under the Banner of Heaven</li><li>Official Mormon response to Under the Banner of Heaven</li><li>Where Men Win Glory: The Odyssey of Pat Tillman</li></ul>");
    }
  });

  var HelloView = Backbone.View.extend({
    initialize: function(){
      console.log("A new hello view has been created!");
    },
    render: function(name){
      var header = $("header");
      header.html("<h2>Hello "+name+"</h2>");
    }
  });

  var KittenView = Backbone.View.extend({
    initialize: function(){
      console.log("A new kitten view has been created!");
    },
    render: function(dim1, dim2){
      var header = $("header");
      header.html("<img src=http://placekitten.com/g/"+dim1+"/"+dim2+"/>");
    }
  });

  var MovieView = Backbone.View.extend({
    initialize: function(){
      console.log("A new film view has been created!");
    },
    render: function(moviename){
      var $header = $("header");

      // instantiate XMLHttpRequest obj
      var request = new XMLHttpRequest();
      // var apiUrl = new String("http://omdbi.com/");       

      // constructed request string w/ str concat 
      var apiUrl = "http://omdbapi.com/"
      var queryParams = "?t=" + encodeURIComponent(moviename);  
                      // e.g. "?t=Pontypool" 
      var apiRequestUrl = apiUrl + queryParams; 

      // initialize request 
      request.open("GET", apiRequestUrl, true);
      // HTTParty.get(api_request_url); 

      // this actually sends the request out to the remote server 
      request.send(null); 

      // we need to add an eventListener to catch the response 
      // when it actually comes in 
      request.addEventListener('load', function() {
        
        // this right here is the response 
        // we know the OMDB API, so we know it's gonna 
        // be a JSON str 
        var omdbJsonStr = request.response; 

                        // parse the JSON 
        var movieObj = JSON.parse(omdbJsonStr); 
                      // syntax identical to ruby 

        // extract relevant movieObj data 
        var yearStr = movieObj.Year;  
        var posterSrc = movieObj.Poster; 
        var titleStr = movieObj.Title;

        // construct inner Html w/ string concat & 
        // our movieObj data we got from a remote server 
        // using AJAX 
        var headerHtml = "<h2>"+titleStr+"</h2>"
        headerHtml = headerHtml+"<img src=\""+posterSrc+"\"></img>"

        // render this inside the view's header 
        $header.html(headerHtml); 
      });      
    }
  });

// This is a router, not a server
// jquery way of doing onload
$(function(){

// make an object variable router(Like active record), that inherits all backbones functions
// Backbone does not use slash like sinatra, root is empty string
  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "movies",
    	"books": "books",
      "hello/:name": "hello",
      "kitten/:dim1/:dim2": "kitten",
      "movie/:moviename": "movie"
    }
  });
// making an instance variable of the object AppRouter
  var router = new AppRouter;

// listening for the root route to be hit, then executing what is inside the function (console.log welcome)
	router.on('route:movies', function() {
		var moviesView = new MoviesView();
    moviesView.render();
	});

	router.on('route:books', function() {
    var booksView = new BooksView();
    booksView.render();
	});

  router.on('route:hello', function(name) {
    var helloView = new HelloView();
    helloView.render(name);
  });

  router.on('route:kitten', function(dim1, dim2) {
    var kittenView = new KittenView();
    kittenView.render(dim1, dim2);
  });

  router.on('route:movie', function(moviename) {
    var movieView = new MovieView();
    movieView.render(moviename);
  });


  Backbone.history.start();

});
