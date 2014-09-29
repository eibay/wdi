$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index",
    	"#create": "targ",
    }
  });

  var router = new AppRouter;

  router.on("route:index", function(){
  	console.log("Welcome to our page!")
  })

  router.on("route:targ"), function(){
  	console.log("Created!")
  }

  Backbone.history.start();

});
