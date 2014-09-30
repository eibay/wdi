var IndexView = Backbone.View.extend({
  initialize: function(){
  	console.log('A new index view has been created');
  	this.render();
  },
  render: function() {
  	this.$el.html('<h2>Welcome to our page!</h2>');
  },
});

var IndexView2 = Backbone.View.extend({
	initialize: function(){
		this.render();
	},
	render: function() {
		var header = $('header');
		header.html('<h2>Welcome to the create page!</h2>');
	}
})

$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
    	'': 'main',
    	'create': 'create'
    }
  });

  var appRouter = new AppRouter;

  appRouter.on('route:main', function() {
    var header = $('header');
  	var indexView = new IndexView({el: header});
  	// indexView.render();
  });

  appRouter.on('route:create', function() {
  	var indexView2 = new IndexView2();
  })

  Backbone.history.start();

});
