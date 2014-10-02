$(function(){

	var AppRouter = Backbone.Router.extend({
		routes: {
			"movies": "movies",
			"books": "books",
			"hello/:name": "hello",
			"movies/:movieName": "movie-name",
			":integer/:integer2": "kitties",
		}

	})

	var router = new AppRouter

	var BooksView = Backbone.View.extend({
		initialize: function() {
			var header = $("header")
			header.empty()
			header.append("<ul>")
			doBooks()
			header.append("<div>Add a book!</div><input type='text'>")
			$("input").keydown(addBook)
		}
	})




	var MoviesView = Backbone.View.extend({
		initialize: function() {
			var movies = ["Groundhog Day", "Rushmore", "Fight Club"]
			var header = $("header")
			header.empty()
			header.append("<ul>")
			movies.forEach(function(movie) {
				console.log(movie)
				$("ul").append("<li><a href='#/movies/" + movie + "'>" + movie + "</a></li>")
			})
		},
	})

	var HelloView = Backbone.View.extend({
		initialize: function(name) {
			this.render(name)
		},

		render: function(name) {
			$("header").text("Hello, " + name)
		},
	});


	var MovieNameView = Backbone.View.extend({
		initialize: function(movie) {
			var header = $("header")
			header.empty()
			header.append("<ul>")
			var movie = encodeURI(document.URL.split("/").slice(-1)[0])
			var req = "http://www.omdbapi.com/?t=" + movie
			jQuery.get(req, function(){
				var obj = arguments[0]
				$("ul").append("<li>Title: " + obj.Title + "</li>").append("<li>Year: " + obj.Year + "</li>").append("<li><img src='" + obj.Poster + "''></li>")
			}, "json")
		}
	})

	var KittiesView = Backbone.View.extend({
		initialize: function() {
			var header = $("header")
			header.empty()
			var dimensions = document.URL.split("/").slice(-2)
			header.append("<div><img src='http://placekitten.com/g/" + dimensions.join("/") + "'></div>")
		}
	})

	router.on("route:movie-name", function() {
		var movieNameView = new MovieNameView
	})

	router.on("route:books", function() {
		var booksView = new BooksView
	})

	router.on("route:movies", function(){
		var moviesView = new MoviesView
	})

	router.on("route:hello", function() {
		var name = document.URL.split("/").slice(-1)[0]
		var helloView = new HelloView(name)
	})

	router.on("route:kitties", function() {
		var kittiesView = new KittiesView
	})

	function generateLI(feed) {
		var rating = JSON.parse(feed.target.response).rating
		var div = $("#last")
		div.append("<div>Goodreads Rating: " + rating + "</div>")
		div.append("<button>delete</button>")
		div[0].id = ("")
		div[0].lastChild.addEventListener("click", deleteFromServer)
	}

	function doBooks() {
		var xhr = new XMLHttpRequest()
		req = "http://127.0.0.1:4567/books"
		xhr.open("GET", req, true)
		xhr.addEventListener("load", makeList)
		xhr.send()
	}

	function makeList(feed) {
		var books = JSON.parse(feed.target.response)
		books.forEach(function(book) {
			$("ul").append("<div id='last'><li>" + book + "</li></div>")
			bookreq = book.split(" ").join("+")
			req = "http://127.0.0.1:4567/book/" + bookreq
			var xhr = new XMLHttpRequest()
			xhr.open("GET", req, true)
			xhr.addEventListener("load", generateLI)
			xhr.send()
		})				
	}

	function deleteFromServer(feed) {
		var unfavorite = feed.target.previousSibling.previousSibling.innerText
		var req = "http://127.0.0.1:4567/books/" + unfavorite
		var xhr = new XMLHttpRequest()
		xhr.open("POST", req, true)
		xhr.addEventListener("load", function() {
			$("header").empty()
			booksView = new BooksView
		})
		xhr.send()
	}

	function addBook(feed) {
		if (feed.keyCode == 13) {
			var book = feed.target.value.split(" ").join("+")
			var req = "http://127.0.0.1:4567/book/" + book
			var xhr = new XMLHttpRequest()
			xhr.open("GET", req, true)
			xhr.addEventListener("load", newBookLI)
			xhr.send()
			$("ul").append("<div class='unsaved'><li>" + feed.target.value + "</li></div>")
			feed.target.value = ""
		}
	}

	function newBookLI(feed) {
		var rating = JSON.parse(feed.target.response).rating
		var div = $("div.unsaved")
		div.last().append("<div>Goodreads Rating: " + rating + "</div>")
		if ($("button.unsaved").length == 0) {
			$("header").append("<button class='unsaved'>Save added books!")
			$("button.unsaved")[0].addEventListener("click", addToServer)
		}

	}

	function addToServer(feed) {
		for (i = 0; i < $("div.unsaved").length; i++) {
			var book = $("div.unsaved")[i].childNodes[0].innerText
			var xhr = new XMLHttpRequest
			req = "http://127.0.0.1:4567/book/" + book.split(" ").join("+")
			xhr.open("POST", req, true)
			xhr.send()
		}
		var booksView = new BooksView
	}

	Backbone.history.start()

})
