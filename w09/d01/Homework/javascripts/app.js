var IndexView = Backbone.View.extend({
	initialize: function(){
		console.log('a new index view has been created')
		this.render()
	},
	render: function(){
		this.$el.html('')
	}
});

var MoviesView = Backbone.View.extend({
	initialize: function(){
		console.log('a new Movies view has been created')
		this.render()
	},
	render: function(){
		this.$el.html('<ul><li><a href="#/movies/Inception">Inception</a></li></ul>')
	}

});

var BooksView = Backbone.View.extend({
	initialize: function(){
		console.log('a new Books view has been created')
		this.render()
	},
	render: function(){
		
		var title = "Portraits"
		var main = $('main')
		main.html('<input></input><button class="add">Add</button>')

		$.get("/books/"+title, function(data){
			console.log(data)	
			var title = data['title']
			var rating = data['rating']
			main.append('<ul><li>'+ title +' - ' + rating +'</li></ul>')
		})

		$('button.add').on("click", function(){
			var title = $('input').value
			$.get('/books/'+title, function(data){
			console.log(data)
			var title = data['title']
			var rating = data['rating']
			main.append('<ul><li>'+ title +' - ' + rating +'</li></ul>')
			})
		
		})
		
	}
});

var HelloView = Backbone.View.extend({
	initialize: function(){
		console.log('a new Hello view has been created')
		this.render()
	},
	render: function(){
		var name = this.$el.selector
		var main = $('main')
		main.html("<p>Hello " + name + "</p>")
	}
});

var KittenView = Backbone.View.extend({
	initialize: function(){
		console.log('a new kitten view has been created')
		this.render()
	},
	render: function(){
		var main = $('main')
		var width = this.$el.selector.split("X")[0]
		var height= this.$el.selector.split("X")[1]
		main.html("<img src='http://placekitten.com/g/"+width+"/"+height+"'/>")
	}
});

var TitleView = Backbone.View.extend({
	initialize: function(){
		console.log('a new title view has been created')
		this.render()		
	},
	render: function(){

	var main =$('main')
	var title = this.$el.selector
	var movieRequest = $.getJSON("http://www.omdbapi.com/?t="+title, function(data){
		var title = data["Title"]
		var year = data["Year"]
		var poster = data["Poster"]
			
		main.html("<h4>"+title+"</h4><h5>"+year+"</h5><img src='"+poster+"'/>")

		})

	
	}
});


//window.onload
$(function(){

var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index", 
    	"movies": "movies",
    	"movies/:title": "title",
    	"books": "books",
    	"hello/:name": "hello",
    	":width/:height": "kitten"
  
    }
  });

  var router = new AppRouter;

  router.on('route:index', function(){
 		var main = $('main')
 		var indexView = new IndexView({el: main})
 	});

 	router.on('route:movies', function(){
 		var main = $('main')
 		var moviesView = new MoviesView({el: main})
 	})

 	router.on('route:books', function(){
 		var main =$('main')
 		var booksView = new BooksView({el: main})
 	})

 	router.on('route:hello', function(){
 		var name = window.location.hash.split('/')[2]
 		var helloView = new HelloView({el: name})
 	})

 	router.on('route:kitten', function(){
 		var width = window.location.hash.split('/')[1]
 		var height = window.location.hash.split('/')[2]

 		var kittenView = new KittenView({el: width+"X"+height})

 	})

 	router.on('route:title', function(){
 		var title = window.location.hash.split("/")[2]
 		var titleView = new TitleView({el: title})
 	});



  Backbone.history.start();

});