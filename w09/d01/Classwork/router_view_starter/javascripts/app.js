
  var IndexView = Backbone.View.extend({
    initialize: function(){
      this.render();
      console.log("A new index view has been created");
      console.log(this);
    },
    render: function(){
      this.$el.html('<h1>Yo, you at mah page.</h1>');
    }
  });

  var CreateView = Backbone.View.extend({
    initialize: function(){
      this.render();
    },
    render: function(){
      var header = $('header');
      header.html('<h1>Create stuff.</h1>');

    }
  })


$(function(){
  var AppRouter = Backbone.Router.extend({
    routes: {
      "" : "blah",
      "create":"created",
      "boom":"boom"
    }
  });

  var appRouter = new AppRouter;

  appRouter.on('route:blah', function(){
    var header = $('header');
    var indexView = new IndexView({el: header});

    // indexView.render();
    // var header = $('header');
    // header.html('<h1>Yo, you at mah page.</h1>');
    $('div').text('');
    $('div').append('Man, what?');
    console.log("Yo, you at mah page.");
  })

  appRouter.on('route:created', function(){
    $('div').text('');

    // var header = $('header');
    // var button = $('body').append("<button>Click Me</button>");
    // header.html('<h1>Create stuff.</h1>');
    var createView = new CreateView;
    var button = $('div').append("<button>Click Me</button>");
    button.on('click', function(){
      var d = $('div')[0];
      d.innerHTML = "<canvas></canvas>";

      var ctx = $('canvas')[0].getContext("2d");
      ctx.rect(20,20,150,100);
      ctx.stroke();
      var button2 = $('div').append("<button>MOAR</button>");
    })
    button2.on('click', function(){
      var ctx = $('canvas')[0].getContext("2d");
      ctx.arc()

    })
  })

  appRouter.on('route:boom', function(){
    $('window').html('');
  })

  Backbone.history.start();

});
