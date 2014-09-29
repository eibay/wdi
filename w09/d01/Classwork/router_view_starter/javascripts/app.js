var IndexView = Backbone.View.extend({
	initialize: function(){
		console.log('a new index view has been created')
		console.log(this)
		this.render()
	},
	render: function(){
		this.$el.html('<h2>Welcome to our page</h2>')
	}
});

var CreateView = Backbone.View.extend({
	initialize: function(){
		console.log('a new create view has been created')
		console.log(this)
		this.render()
	},
	render: function(){
		var header = $('header');
		header.html('<h2>create page</h2>')
	}
});


$(function(){ // == window.onload = function()


	//creating a new object that inherits Backbone Router methods
  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index", 
    	"create": "create"
    }
  });

  var router = new AppRouter;
  // var header = $('header')

 	router.on('route:index', function(){
 		var header= $('header')
 		var indexView = new IndexView({el: header})

 		// console.log('welcome')
 		// var header = $('header')
 		// header.html("<h1>welcome</h1>")
 	});

 	router.on('route:create', function(){
 		var createView = new CreateView();
 		// alert('create page')
 		// var header = $('header')
 		// header.html('<h2>create page</h2>')
 	});

  Backbone.history.start();

});
