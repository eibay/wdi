$(function(){

  var IndexView = Backbone.View.extend({
    initialize: function(){
    console.log("A new Index view has been created");
    this.render();
    },
    render: function(){
    var header = $('header');
    this.$el.html("<h2>Welcome to our page!</h2>");
    }
  });

  var CreateView = Backbone.View.extend({
    initialize: function(){
      console.log("A new create view has been made.");
      this.render();
    },
    render: function(){
      var header = $('header');
      header.html("<h2>Create stuff here!!</h2>");
    }
  });

  //argument that extend takes is a hash.
  var AppRouter = Backbone.Router.extend({
    routes: {
    	//what will my route look like?
    	"": "index",
    	"create": "create",
    	/*also could do
    	"otherroute": "index"*/
    }
  });

  //creating a new instance
  var router = new AppRouter;

  router.on('route:index', function(){
    var header = $('header');
    var indexView = new IndexView();
  	/*indexView.render();*/
  });

  router.on('route:create', function(){
  	var createView = new CreateView();
  	header.html("<h2>You can create stuff here!</h2>");
  });

  router.on('route:index', function(){
    var indexView = new IndexView();
  });

  Backbone.history.start();

});


