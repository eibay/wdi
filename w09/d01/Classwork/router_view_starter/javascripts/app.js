	var IndexView = Backbone.View.extend({
		initialize: function(){
				console.log("A new Index view has been created ");
				this.render()
		},
		render: function(){
			var header = $('header')
			this.$el.html("<h2>Welcome to our page! </h2>");
		}
	});

	var CreateView = Backbone.View.extend({
		initialize: function(){
			console.log("A new Create view has been created");
			this.render()
		},
		render: function(){
			var header = $('header')
			header.html("<h2>CREATE!</h2>");
		}
	})



$(function(){
  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index",
    	"create": "create",
    }
  });

  var router = new AppRouter;

  router.on('route:index', function(){
  	var indexView = new IndexView({el: header});
  	console.log("Welcome to our page!");
  })

  router.on('route:create', function(){
  	var createVIew = new CreateView
  	console.log("Create some stuff!");
  })

  Backbone.history.start();

});
