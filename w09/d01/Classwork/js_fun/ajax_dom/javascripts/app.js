	var IndexView = Backbone.View.extend({
		initialize: function(){
			console.log("A new Index view has been created");
			this.render();
			},
			render: function(){
				this.$el.html("<h1>Welcome to our page!</h1>");
			}	
	});

	var CreateView = Backbone.View.extend({
		initialize: function(){
			console.log("a new Create view has been created");
			this.render();
		},
		render: function(){
			var header = $('header');
			header.html("<h1>Create stuff here</h1>");
		}
	})

$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
    	"" : "index",
    	"create" : "create"
    }
  });

  var router = new AppRouter;
  var header = $('header');

  router.on("route:index", function(){

	console.log("Welcome to our page");
	var indexView = new IndexView(header);
});

  router.on("route:create", function(){
	console.log("Create route hit");
	var createView = new CreateView();	
});
  

  Backbone.history.start();
});