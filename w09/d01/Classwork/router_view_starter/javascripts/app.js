var IndexView = Backbone.View.extend({
		initialize: function(){
			console.log('A new Index view has been created');
			this.render();

		},

		render: function(){
			this.$el.html('<h2>Welcome to our page!</h2>').hide().fadeIn(600);
		}
	});

		var CreateView = Backbone.View.extend({
		initialize: function(){
			console.log('A new Create view has been created')
			this.render();
		},

		render: function(){
			var header = $('header');
			header.html('<h2>Create stuff!</h2>').hide().fadeIn(600);
		}
	})

$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index",
    	"create": "create"
    }
  });

  var router = new AppRouter;

  router.on('route:index', function(){
  	var header = $('header');
  	var indexView = new IndexView({el: header});
  	// var header = $('header');
  	// header.html('<h2>Welcome to our page!</h2>');
  });

  router.on('route:create', function(){
  	var createView = new CreateView();
  	// var header = $('header');
  	// header.html('<h2>Create stuff!</h2>');
  });

  Backbone.history.start();

});
