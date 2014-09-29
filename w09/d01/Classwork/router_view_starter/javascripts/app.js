var IndexView = Backbone.View.extend({
	initialize: function() {
		console.log("A new Index view has been created.")
		this.render()
	},

	render: function() {
		// this.$el.html("<h2>Welcome to our page!</h2>")
		console.log(this.$el)
	}
});

var CreateView = Backbone.View.extend({
	initialize: function() {
		console.log("A new Create view has been created.")
		this.render()
	},

	render: function() {
		var header = $("header")
		header.html("<h2>Create things here!</h2>")
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

  router.on("route:index", function(){
  	console.log("Welcome to our page!")
  	var header = $("header")
  	var indexView = new IndexView(header)
  })

  router.on("route:create", function(){
  	var createView = new CreateView
  })

  Backbone.history.start();

});
