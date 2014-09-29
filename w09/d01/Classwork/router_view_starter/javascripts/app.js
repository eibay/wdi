<<<<<<< HEAD
// below is a hash?
  var IndexView = Backbone.View.extend({
    initialize: function(){
      console.log("A new index view has been created!");
    },
    render: function(){
      var header = $("header");
      header.html("<h2>Welcome to our page!</h2>");
    }
  });

  var CreateView = Backbone.View.extend({
    initialize: function(){
      console.log("Welcome to the Create Page!");
    },
    render: function(){
      var header = $("header");
      header.html("<h2>Welcome to our create page!</h2>");
    }
  });

// This is a router, not a server
// jquery way of doing onload
$(function(){

// make an object variable router(Like active record), that inherits all backbones functions
// Backbone does not use slash like sinatra, root is empty string
  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index",
    	"create": "create"
    }
  });
// making an instance variable of the object AppRouter
  var router = new AppRouter;

// listening for the root route to be hit, then executing what is inside the function (console.log welcome)
	router.on('route:index', function() {
		var indexView = new IndexView();
    indexView.render();
	});

	router.on('route:create', function() {
    var createView = new CreateView();
    createView.render();
	});
=======
$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
    }
  });

  var appRouter = new AppRouter;
>>>>>>> 72ee463e9a5a1111200975acb0f3c9407ebaa43c

  Backbone.history.start();

});
