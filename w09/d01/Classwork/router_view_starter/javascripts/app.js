var IndexView = Backbone.View.extend({
	initialize: function(){
		console.log("new view made");
		this.render();
	},
	render: function(){
		console.log("welcome to our page");
		var link = document.createElement("a");
		link.setAttribute('href',"./index.html#create");
		link.innerText = "create"
		var body = document.querySelector("body")
		body.appendChild(link)
		var body = $("body");
		console.log(body)
		body.css("background-color", "yellow");
	}
})

var CreateView = Backbone.View.extend({
	initialize: function(){
		this.render();
	},
	render: function(){
		var link = $("a");
		link.attr('href',"./index.html");
		link.text = ("home");
		var body = $("body");
		console.log(body)
		body.css("background-color", "orange");
		console.log("test");
	}
})

$(function(){

	var AppRouter = Backbone.Router.extend({
		routes: {
			"": "index",
			"create": "create"
		}
	});

	var router = new AppRouter;

	router.on('route:index', function(){
		var indexView = new IndexView();
	// indexView.render();
})

	router.on('route:create', function(){
		var createView = new CreateView();
	})

	Backbone.history.start();

});

		// var body = document.querySelector("body")
		// body.setAttribute('style', "background-color: orange;");
		// console.log("test");