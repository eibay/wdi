var IndexView = Backbone.View.extend({
	initialize: function(){ //whenever new instance is made, initialize() is executed
		console.log('a new instance has been created');
		this.render();
	},
	render: function(){
		var header = $('header');
		this.$el.html('<h2>Welcome to our web page!</h2>');
	}
});


var CreateView = Backbone.View.extend({
	initialize: function(){
		console.log('a new octopus has been created');
		this.render();
	},
	render: function(){
		var header = $('header');
		this.$el.html('<h2> OCTOPUS OCTOPUS OCTOPUS VIEW </h2>');
	}
});









$(function(){

  var AppRouter = Backbone.Router.extend({ //create class that inherits attributes and properties from Backbone.Router
    routes: {
    	"": "index", // "index" can be anything, don't put slash
    	"otherRoute": "index",
    	"create": "create"

    }
  });

  var appRouter = new AppRouter; // create instance of the class
  
  appRouter.on('route:index', function(){
  	var header = $('header');
  	var indexView = new IndexView({el: header});
  	console.log("index");

  	// console.log("welcome to our page!");
  	// var header = $('header');
  	// header.html("<h2> Welcome to our page! </h2>");
  })

  appRouter.on('route:create', function(){
  	var li = $('li');
  	var createView = new CreateView({el: li});
  	console.log("create");

  	// alert('CREATION!');
  	// var header = $('header');
  	// header.html("<h1 style='color: red;'>creation!</h1>");
  })

  Backbone.history.start();

});
