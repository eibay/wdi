var KittenViews = Backbone.View.extend({
	render: function(kittenHtml){
		$("div").html(kittenHtml)

	}
})

var BookViews = Backbone.View.extend({
	render: function(){
	$("div").html("<h1>Tess's Favorite Books</h1><ul><li><a href=''>Sex Drugs and Coco Puffs</a></li><li><a href=''>Let's Expolre Diabetes with Owls</a></li><li><a href=''>Breakfast of Champions</a></li></ul><br><br><form method='GET' action='#create/*book'><input type='text' name='book' placeholder='booktitle'><button>Submit</button>")
	}
})

var MovieViews = Backbone.View.extend({
	render: function(){
		$("div").html("<h1>Tess's Favorite Movies</h1><ul><li><a href='#movies/A+League+of+Their+Own'>A League of Their Own</a></li><li><a href='#movies/The+Wedding+Singer'>The Wedding Singer</a></li><li><a href='#movies/A+Clockwork+Orange'>A Cloclwork Orange</a></li></ul>")
	}
})

$(document).ready(function(){

	var AppRouter = Backbone.Router.extend({
		routes:{
			"":"index",
			"movies":"movies",
			"books":"books",
			"hello/*name":"hello",
			"kitten/*num1/*num2":"kittens",
			"movies/*title":"movie",
			"create/*book":"newBook",
	
		}
	})
	var appRouter = new AppRouter;
	appRouter.on("route:index", function(){


	})
	appRouter.on("route:movies", function(){
		var movieViews = new MovieViews;
		movieViews.render();
	})

	appRouter.on("route:movie", function(title){

		var data = $.ajax({
			dataType: "json",
			url: "http://www.omdbapi.com/?i=&t="+ title ,
		}).done(function() {
	  	$( this ).addClass( "done" );
			var info = data.responseJSON
			$("div").html("<h2>" + info.Title + "("+ info.Year +")</h2>" +"<img src=" + info.Poster + ">")
		});
	})


	appRouter.on("route:books", function(){
		var bookViews = new BookViews;
		bookViews.render();

	})

	appRouter.on("route:newBook", function(newBook){
		console.log(this)
		var title = ""
		var data = $.ajax({
			dataType: "json",
			url: "127.0.0.1:4567/goodreads/" + title
		})
		console.log("new book route")
	})



	appRouter.on("route:hello", function(name){
		$("div").text("Hello "+ name +"!")

	})
	appRouter.on("route:kittens", function(num1, num2){
			var kittenURL = "http://placekitten.com/g/"+num1+"/"+num2
		  kittenHtml = "<img src="+kittenURL+">"
		  kittenView = new KittenViews
		  kittenView.render(kittenHtml)


	})

	Backbone.history.start();

})