var MoviesView = Backbone.View.extend({
	initialize: function(){
		console.log("Movies view has been created");
		this.render()
	},
	render: function(){
		var header = $('header')
		var div = $('div')
		header.html("<h2>Favorite Movies </h2>");
		div.html("<ul><li> The Butterfly Effect</li><li>The Notebook</li><li> The Sunset Unlimited </li></ul>")
	}
});

var BooksView = Backbone.View.extend({
	initialize: function(){
		console.log("Books view was created")
		this.render()
	},
	render: function(){
		var header = $('header')
		var div = $('div')
		header.html("<h2> Favorite Books </h2>")
		div.html("<ul><li>The Time Travelers Wife</li><li>Think like a freak</li><li>Game of Thrones</li></ul>")
	}
});

var KittensView = Backbone.View.extend({
	initialize: function(){
		console.log("Kittens view was created")
		this.render()
	},
	render: function(kitten){
		var header = $('header')
		var div = $('div')
		this.$el.html(kitten)
	}
})


$(function(){
	var AppRouter = Backbone.Router.extend({
		routes:{
			"movies":"movies",
			"books":"books",
			"hello/*name":"hello",
			"200/200":"kittens",
			"movies/*moviename": "moviename"
		}

	});

	var appRouter = new AppRouter;

	appRouter.on('route:movies', function(){
		var header = $('header')
		var div = $('div')
		var moviesView = new MoviesView({el: header}, {el: div})
		console.log("Hit movies route")
	})

	appRouter.on('route:books', function(){
		var header = $('header')
		var booksView = new BooksView({el: header})
		console.log("Hit books route")
	})

	appRouter.on('route:kittens', function(){
		var div = $('div')
		var kittensView = new KittensView({el: div})
		
		var callback = 
			$.ajax({
				url: "http://placekitten.com/g/200/300",
			}).done(function(){
			$(this).addClass("done");
				var kittenPic = this.url
				var kitten = "<img src=" + kittenPic + ">"
				kittensView.render(kitten)
				console.log(kittenPic)
				console.log(callback)
			})
		})
	appRouter.on('route:hello', function(name){
		var div = $('div')
		div.text("Hello" +" "+ name)
		console.log("hit name route")
		console.log(name)
	})

	appRouter.on('route:moviename', function(moviename){
		console.log("hit moviename route")
		console.log(moviename)
		var div = $('div')
		div.html("<ul><li><a href=http://www.omdbapi.com/?t="+moviename+">"+moviename+"</a></li></ul>")
	})
	Backbone.history.start();
})




