var IndexView = Backbone.View.extend({
	initialize: function(){
		console.log("A new index view has been created");
		this.render()
	},
		render: function(){
		var head = $("header")
		head.text("Welcome to our page")
	},	

})

var CreateView = Backbone.View.extend({
	initialize: function(){
		console.log("A new create view has been instantiated")
		this.render()
	},
	render: function(){

		this.$el.text("You can create things here!")
	}

})

$(function(){




	// indexView.render();

  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index",
    	"create": "create"
    }
  });

  var router = new AppRouter;
  router.on("route:index", function(){
  	// var head = $("header")
  	// head.text("Welcome to our page")

  	var indexView = new IndexView
		
  	console.log("welcome!")
	});
  	
  router.on("route:create", function(){
  	var head = $("header")
  	// $(head).text("you are using backbone!")
  	var createView = new CreateView({el: head})
  	console.log("you made a new route")
		})
  	
  
  Backbone.history.start();


});
