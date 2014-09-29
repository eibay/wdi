	var IndexView = Backbone.View.extend({
		initialize: function(){
			this.render()
			console.log("A new Index view has been created");
		},
		render: function(){
			// var header = $('header');
			this.$el.html("<h2>Welcome to our page!</h2>");
		}
	});

	var CreateView = Backbone.View.extend({
		initialize: function(){
			this.render()
			console.log("A new Create view has been created");
		},
		render: function(){
			var header = $('header');
			header.html("<h2>Welcome to the create page!</h2>");
		}
	});

	// Defined the above routes outside of the $(function)(). Not mandatory to do so. A choice.

$(function(){
// JQuery equivalent of window.onload

  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index",
    	"create": "create"
    }
  });
// Creates an object (like a class) called AppRouter. It inherits all of the attributes of Backbone.Router. Similar to ActiveRecord inheritance in Ruby classes. All of Backbone is a repitition of this process.

// New object takes an argument which is a hash of routes. Routes will be key-value pairs in the hash.

  var router = new AppRouter;
// Creates a new instance of the object.

	router.on('route:index', function(){
		var header = $('header');
		var indexView = new IndexView({el: header});
		// indexView.render();
		// var header = $('header');
		// header.html("<h2>Welcome to our page!</h2>");
	});

	router.on('route:create', function(){
		var createView = new CreateView();
		// var header = $('header');
		// header.html("<h2>Welcome to the create page!</h2>");
	});

  Backbone.history.start();
// Complicated to explain, but required code to run. 

});
