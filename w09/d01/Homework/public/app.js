$(function(){

	var MovieView = Backbone.View.extend({

		initialize:function(options){
			this.render(options.array, options.type)
		},
		render: function(array, type){
			$('#container').html('')
			$('#container').append('<ul class="awesome"></ul>')
			array.forEach(function(item){
				$('.awesome').append('<li><a href="#'+type+'/'+item+'">'+item+'</a><button class="delete">Delete</button></li>')
			})
			$('#container').prepend('<input type="text" class="addmovie"><button class="addit">Add It</button>')
		}


	})
	var BookView = Backbone.View.extend({

		initialize:function(options){
			this.render(options.array, options.type)
		},
		render: function(array, type){
			$('#container').html('')
			$('#container').append('<ul class="awesome"></ul>')
				
				_.each(array, function(item){  
				$.get('/books?title='+item).done(function(data){
					console.log(data)
					$('.awesome').append('<li>'+item+'-'+data["rating"]+'</li>')
				})
			})
		}


	})
	var IndividualMovie = Backbone.View.extend({

		initialize:function(options){

			this.render(JSON.parse(options.stuff))
		},
		render: function(hash){
			$('#container').html('<h1>'+hash["Title"]+'</h1><h2>Year:'+hash["Year"]+'</h2><img src="'+hash["Poster"]+'">')


		}


	})
	var AppRouter = Backbone.Router.extend({
		routes: {
			"": "index",
			"movies":"movies",
			"books":"books",
			"hello/:name":"hello",
			"movie/:moviename": "individualmovie",
			":num/:num2":"placekitten"
		}
	});
	var appRouter=new AppRouter;
	
	appRouter.on('route:index', function(){

		$('#container').html('<h1>Click A link</h1>')


	})

	appRouter.on('route:hello', function(name){
		$('#container').html('<h1>Hello '+ name+'</h1>')

	})

	appRouter.on('route:placekitten', function(num1, num2){
		$('#container').html('<img src="http://placekitten.com/g/'+num1+'/'+num2+'">')

	})

	appRouter.on('route:movies', function(){

		$.get('/movies').done(function(response){
			movieView = new MovieView({array:response, type:'movie'})
			$('.addit').on('click', function(){
				var data={title: $('.addmovie').val()}
				$.post('/movies', {data: JSON.stringify(data)}).done(function(response){
					$('.awesome').append('<li><a href="#movie/'+response["title"]+'">'+response["title"]+'</a><button class="delete">Delete</button></li>')
					$('.delete').on('click', function(event){
						var that = $(this)
						$.get('/deletemovie?title='+$(this).prev().text()).done(function(){
							that.parent().remove()
						})
					})
				})
			})

			$('.delete').on('click', function(event){
				var that=$(this)
				$.get('/deletemovie?title='+$(this).prev().text()).done(function(){
					that.parent().remove()
				})
			})
		})

	})
	appRouter.on('route:books', function(){

		bookView = new BookView({array:["Animal Farm", "Catch 22"], type:'book'})
	})

	appRouter.on('route:individualmovie', function(movie){
		$.get('http://www.omdbapi.com/?t='+movie, function(data){
			movieView= new IndividualMovie({stuff: data})	

		})



	})
	Backbone.history.start()
})