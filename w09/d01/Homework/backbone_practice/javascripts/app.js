// Goodreads API Key: AwFbcVEoMR28ER1w8Xjg

$(function (){
	var IndexView = Backbone.View.extend({
	  initialize: function(){
		console.log("My book, movie, hello app index.");
		this.render();
	 },
	  render: function(){
	      this.$el.html("<h2>A Fine Selection of Books and Films</h2>");
	    }
	});

	$(function(){
		var AppRouter = Backbone.Router.extend({
			routes: {
				"": "index",
				"books": "books",
				"movies": "movies",
				"hello/:name": "hello"
			}
		});

    var router = new AppRouter;

    router.on('route:index', function(){
    	var header = $('header');
    	var indexView = new IndexView({el: header});
    });

    router.on('route:books', function(){
    	var header = $('header');

    	var books = [
    		{
    			title: "Hell's Angels",
    			author: "Hunter S. Thompson"
    		},
    		{
    			title: "The Electric Kool-Aid Acid Test",
    			author: "Tom Wolfe"
    		}
    	];

    	var outputHtml = "";

    	for (var i = 0; i < books.length; i++) {
    		var title = books[i].title.split(" ").join("+");
    		var author = books[i].author.split(" ").join("+");
    		var rating = 0;

    		// Variable scope here is tricky. How to get the title, author, and rating
    		// all into the scope of outputHtml?
    		// Also, loop behavior is weird. Too tired to figure out now :-/
    		$.ajax({
    			url: "http://localhost:4567/rating/" + author + "/" + title, 
    			success: function(data) { 
    				console.log(title, author, data);
    			}
    		});
    		
    	}

        header.html(outputHtml);
    	//var createView = new CreateView();
    });

    router.on('route:movies', function(){
    	var header = $('header');
        header.html("<li>Chinatown</li><br><li>Bladerunner</li><br><li>Trainspotting</li><br><li>Road Warrior</li><br>");
    	var createView = new CreateView();
    });

    router.on('route:hello', function(name){
    	var header = $('header');
        header.html("<p>Hello, " + name + "</p>");
    	var createView = new CreateView();
    });

    router.on('route:#/200/200', function(){
    	var header = $('header');
        header.html();
    	var createView = new CreateView();
    });

  /*  var Navigation = Backbone.Model.extend({
    promptColor: function() {
    var cssColor = prompt("red");
    this.set({color: red});
    }
    });*/

    
    router.navigate('index', true);
    router.navigate('books', true);
    router.navigate('movies', true);
    router.navigate('hello', true);

    });
   
 
    Backbone.history.start();

  });