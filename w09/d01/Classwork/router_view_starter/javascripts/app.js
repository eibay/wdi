  var IndexView = Backbone.View.extend({
    initialize: function(){
      this.render()
      console.log("new index")


      //all new instances will have to do this
      // to play around with it in console move befre window.onload
      // this here or render will be the new instance that you have made
      // like ruby dog = Dog.new(name: "Fido")
      //dog.name = "Fido"

      },

    render: function(){
       $('header').text("hello again")
       //to get element out of the function of the new instance
       //this.$el.html("hdasjkdhasjdhajshdjas")

       //.html ("<h1> hello again </h1>")
       //to call this .render() on the new instance
       //there is a reason we do this-but will get to it later
       // can make it dynamic by giving it variables
       //but most of the time every route has a new view

      }
    
  })

  //bfore window.onload so we can call it before document loading
  //doesnt break code if after
  //but dont require it
  //esp when complicated wwant to define it here


  var CreateView = Backbone.View.extend({
    initialize: function(){
      this.render()
      console.log("create")
    },

    render: function(){
      console.log("hey")
      $('header').html("<h1>CREATE</h1")
    }
  })




$(function(){
  //jquerys way of doing onload

  var AppRouter = Backbone.Router.extend({
    //basically what we do in activerecord
    //making the new router able to have backbone 
    //methods and functions
    //capital for us not needed
    //ActiveRecord we had do it
    //javscript uses object instead of class
    routes: {
      //it will be hash of every route 
      //wants the code of every route 
      //somewhere else
      //extend takes the argument in a hash
      //in that hash there is a another hash 
      //key routes and value is another hash 
      //all the routes
      "": "index",
      //can make two routes to same place
      // "other": "index"
      "create": "create"
      //this is how it accepts route /
      //index is what we call the code
    }
  });





  var router = new AppRouter;
  //dont use class methods but only instance methods
  //so have to make instance methods to use
  // so making a new instance of AppRouter
  //activeRecord uses Class methods so dont have to do
  //this

  router.on('route:index', function(){
    console.log(this)
    //this is new instance of router that you made
    var indexView = new IndexView()
    //define header
    // pass in a hash({el: header})
    //can use jquery selector as well

  // making a new instance of IndexView
  // indexView.render()
  //can call it in initalize

  //calling the render function on the new instance
  // $('header').text("hello again")
  //should do under render
  // of can var header = $('header')
  //and then text()
  //can define header outside
    //to call .on need a new instance
    //then put everything in here
  })


  router.on('route:create', function(){
    var createView = new CreateView();
   
  })
  //when hit this route run this code

  Backbone.history.start();
  //complicated
  //have to do it

});
