
var IndexView = Backbone.View.extend({

	initialize:function(){

		console.log('theindex')
		this.render()			

	},
	render: function(){

		$('header').html('<h1>Welcome To Our Page</h1>').hide().fadeIn(800)

	}

})
var CreateView = Backbone.View.extend({

	initialize:function(){

		this.render()
	},
	render: function(){
		$('header').html('<h1>Create Page</h1>').hide().fadeIn(800)
	}

	
})
$(function(){
	var AppRouter = Backbone.Router.extend({
		routes: {
			"": "index",
			"create": "create"
		},

	});
	var appRouter = new AppRouter;
	appRouter.on('route:index', function(){
		var indexView = new IndexView
	})
	appRouter.on('route:create', function(){
		var createView = new CreateView
	})


	Backbone.history.start();

});




