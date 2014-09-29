// moving to top to play in console (and so available before page is finished loading, but you don't have to)
var IndexView = Backbone.View.extend({
// initialize executes when you create an instance
// sets attributes or runs code
  initialize: function(){
// this is a hash
    console.log("A new Index view has been created");
// render the view now being created
    this.render();
  },
// 
  render: function(){
    // var header = $('header');
    this.$el.html('<h2>Welcome to our page!</h2>');
  }
});

var CreateView = Backbone.View.extend({
  initialize: function(){
    console.log("Create in the house");
    this.render();
  },
  render: function(){
    var header = $('header');
    header.html('<h2>Create some stuff!</h2>');
  }
});

// this function is jQuery for onload
$(function(){

// like Ruby class where models inherited methods from ActiveRecord

// Backbone has Router code in it, so now AppRouter has that stuff
// creating object
  var AppRouter = Backbone.Router.extend({
  	// this is the argument that the router takes
  	// hash of all routes -- only the routes here
  	// code to execute lives elsewhere
    routes: {
      // "" equivalent to "/" --- "index" refers to code
      // this is a hash
    	"": "index",
      "create": "create",
    }
  });

// instantiate is necessary because all are instance methods
  var router = new AppRouter;

// like a listener (2 arguments -- what to listen for and callback --- ':index' is the bridge to routes)
  router.on('route:index', function(){
    // var header = $('header');
    // header.html('<h2>Welcome to our page!</h2>');
    var header = $('header');
    var indexView = new IndexView({el: header});
    // indexView.render();
  });

  router.on('route:create', function(){
    var createView = new CreateView();
  });


// needed
  Backbone.history.start();

});
