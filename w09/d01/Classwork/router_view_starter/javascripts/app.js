// $(function(){

//   var AppRouter = Backbone.Router.extend({  // creating an object that inherits attriubtes/method from the backbone library
	    
//     routes: { 		  // a hash of every route goes here, in one place. the code will go in another place
//     	"": "index"  // in ruby, it would be "/" : "index". backbone sees / as an empty string

//     }
//   });

//   var router = new AppRouter; 	// making a new instance of that object

 
//  router.on('route:index', function() { 	 // .on takes two arguments: an event and function
// 										// route is a keyword
  
//   	console.log("Welcome to our page!");
//   }); 

//   Backbone.history.start();

// });

////////////////////////////////////////////////////////////
// cleaner version w/out comments (comment out code to see) //

// ROUTE

// $(function(){

// 	  var AppRouter = Backbone.Router.extend ({  
// 	    routes: { 		 
// 	    	"": "index",  
// 	    	"create": "create"
// 	    }
	  
// 	  });

// 	  var router = new AppRouter; 	

// 	  router.on('route:index', function() { 
// 	  	var header = $('header');
// 	  	header.text('YO WELCOME TO THE INTERWEBZ');
	  	
// 	  	console.log("Welcome to our page!");
// 	  }); 

// 	  router.on('route:create', function() { 
// 	  	alert("CREATE PAGE");

// 	  	var header = $('header');
// 	  	header.html('<marquee scrollamount="50"><button><h1> ABASLKDJALKDSJZ </h1></button></marquee>');
	  	
// 	  	console.log("create #/create");

// 	  }); 

// 	  Backbone.history.start();

// });

////////////////////////////////////////////////////////////
 // VIEWS

	var IndexView = Backbone.View.extend ({
		initialize: function(){ // we initialize each time an instance is made
			console.log("a new index view has been made!");
			this.render();
		}, 						// a comma is used because it is a hash we are dealing with
		render: function(){
			var header = $('header');
		  	// header.text('YO WELCOME TO THE INTERWEBZ');
		  	this.$el.html('<h2>YO WELCOME TO THE INTERWEBZ</h2>'); // makes it dynamic
		  	console.log('welcome to your new page');
		}
	});


	var IndexView_2 = Backbone.View.extend ({ // need a new index view for each view/route 
		initialize: function(){ 
			console.log("a 2nd new index view has been made!");
			this.render();
		}, 						// a comma is used because it is a hash we are dealing with
		render: function(){
			var header = $('header');
	  		header.html('<form action="http://www2.warnerbros.com/spacejam/movie/jam.htm"><marquee scrollamount="100"><button><h1> ABASLKDJALKDSJZ </h1></button></marquee></form>');
	  		console.log('CREATE PAGE');

		}
	});



$(function(){


	  var AppRouter = Backbone.Router.extend ({  
	    routes: { 		 
	    	"": "index",  
	    	"create": "create"
	    }
	  });

	  var router = new AppRouter; 	

	  router.on('route:index', function() { 
	  	var header = $('header');
		var index_view = new IndexView({el: header}); // make a new instance to show text
	
	  }); 

	  router.on('route:create', function() { 
		var index_view_2 = new IndexView_2({el: header}); // make a new instance to show text

	  }); 

	  Backbone.history.start();

});
