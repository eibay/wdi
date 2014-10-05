	var IndexView = Backbone.View.extend({
		initialize: function(){
			console.log("A new Index view has been created");
			this.render();
			},
			render: function(){
				this.$el.html("<h1>Welcome to our page!</h1>");
			}	
	});


$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
    	"" : "index",
    	"create" : "create"
    }
  });

  var router = new AppRouter;
  var button = $('button');
  

  router.on("route:index", function(){
	console.log("Client reached index");
	var indexView = new IndexView(header);
});

  

  Backbone.history.start();
});