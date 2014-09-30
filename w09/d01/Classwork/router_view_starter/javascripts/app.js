 var IndexView = Backbone.View.extend({
 	render: function(){
 		var header = $('header');
 		header.html("<h2>New IndexView object has been created!</h2>")
 	},
 	initialize: function(){
  		console.log("A new Index view has been created!");
  		this.render();
 	}
 });

 var CreateView = Backbone.View.extend({
 	initialize: function(){
 		console.log("A new Create view has been made");
 		this.render();
 	},
 	render: function(){
 		// var header = $('header');
 		this.$el.html("<h2>Ohayooo</h2>") 
 	}
 });

$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index",
    	"create": "create",
    	"practice": "practice"
    }
  });

  var router = new AppRouter;

  router.on('route:index', function(){
  	// console.log("Welcome to our page!");
  	// var header = $('header');
  	// header.html('<h2>Hello to main page!</h2>');
  	var header = $('header');
  	var createView = new CreateView({el: header});
  });

  router.on('route:create', function(){
  	console.log("Welcome to a create page!");
  	var header = $('header');
  	header.html("<h2>Welcome to create page!</h2>");
  	// var indexView = new IndexView();
  	// indexView.render();
  });

  router.on('route:practice', function(){
  	console.log("Welcome to our practice!")
  	var createView = new CreateView();
  });


  Backbone.history.start();

});

