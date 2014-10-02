var IndexView = Backbone.View.extend({
	initialize: function(){
		console.log("A new Index view has been created");
		this.render();
	},
	render: function(){
  	this.$el.html("<h2>Welcome to our page!</h2>");
	}
});

var CreateView = Backbone.View.extend({
	initialize: function(){
		console.log("A new Create view has been made");
		this.render();
	},
	render: function(){
		var header = $('header');
  	header.html("<h2>Create stuff here!!</h2>");
	}
});

$(function(){

 	var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "lemur",
    	"create": "create"
    }
  });

  var router = new AppRouter;

  router.on('route:lemur', function(){
  	var header = $('header');
  	var indexView = new IndexView({el: header});
  	// indexView.render();
  });

  router.on('route:create', function(){
  	// var header = $('header');
  	// header.html("<h2>You can create stuff here!</h2>");
  	var createView = new CreateView();
  });

  Backbone.history.start();

});
