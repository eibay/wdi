var IndexView = Backbone.View.extend({
    initialize: function() {
        console.log("A new index view has been created");
        this.render();
    },
    render: function() {
     this.$el.html("<h2>Welcome to our page!</h2>")
    }
  });

var CreateView = Backbone.View.extend({
  initialize: function() {
    console.log("A create index view has been created");
    this.render();
  },
  render: function() {
    var createheader = $('marquee');
    createheader.html("<h2>You can create stuff here!</h2>")
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

  router.on('route:index', function() {
    var header = $('marquee');
    var indexView = new IndexView({el: header});
    //indexView.render();
  });

  router.on('route:create', function() {
    var createView = new CreateView;
  });

  Backbone.history.start();

});

// var AppRouter = Backbone.Router.extend

// That above line does alot in itself. .extend is similar to when we inherited from activerecord in our sinatra app. For example class post < ActiveRecord::Base end

// By itself class post doesnt have a way to talk to our database bc it doesnt have any methods associated with it, the ac methods .create, .find etc are inherited from ac.

// so extend allows us to inherit from backbone all its methods onto our router. We wanna create a class AppRouter and give it all the methods backbone has.

// All of backbone works this way where a variable/class for our router is created and we have it inherit all the methods and stuff from backbone and then later we have another variable set to a new instance of that.

// line 4 is an argument that line 3 takes which is just a hash of routes.


// Line 11 is the bridge connecting our route code to the view its supposed to display when that code hits bc now unline sinatra we are separating our code execution from our route naming.

// Backbone knows to look for the page index.html bc there is only one page to look for in backbone.







