function removeItem(itemID){
	$.post('/remove/'+itemID)
};

function updateBought(itemID){
	$.post('/bought/'+itemID)
};

function updateQuantity(itemID, quantity){
	$.post('quantity/'+itemID+"/"+quantity)
};

var ItemView = Backbone.View.extend({
	
	tagName: 'li',

	events: {
		"click button.test" :"remove",
		"click .bought" :"mark",
		"keydown" :"keyAction"
	},

	remove: function() {
		this.el.remove()
		var id = this.id
		removeItem(id)
	},

	mark: function() {
		var id = this.id
		updateBought(id)
		$(this.$el).css('text-decoration', 'line-through')

	},

	keyAction: function(e){
		var id = this.id
		if (e.keyCode == 13){
			var quantity = $('input.quantity').val()
			updateQuantity(id, quantity)
			$('input.quantity').val('')
			this.quantity = quantity
			this.render()
		}
	},

	initialize: function(opt) { 
		console.log('a new list view has been created')
		this.item = opt.item
		this.quantity = opt.quantity
		this.render()
	},
	
	render: function() {
	
		var innards = "<h2>" + this.item + ", "+this.quantity+"</h2><input class='quantity' placeholder='quantity'></input><button class='test'>Remove</button><input type='checkbox' class='bought'></input>"
		this.$el.html(innards)

	}
});



$(function(){

	 var AppRouter = Backbone.Router.extend({
    routes: {
    	"": "index"
    }
 	 });

	 var router = new AppRouter;

	 router.on('route:index', function(){
		var items = $.get('/all', function(data){
			$.each(data, function(key, value){
				var itemView = new ItemView({item: value.item, id: value.id, quantity: value.quantity})
				$('ul').append(itemView.el)
			})
		})
	 });





	Backbone.history.start();




	var ul=$('ul')

		$('button.add').on('click', function(){
		
		var item = $('input.item').val()
		var itemView = new ItemView({item: item})
		$('ul').append(itemView.el)

		
	});

	$('input').on('keydown', function(e){
		if(e.keyCode ==13){
			var item = $('input.item').val()
			var itemView = new ItemView({item: item, quantity: 0})
			
			$('ul').append(itemView.el)
			
			$.post('/add/'+item, function(){

				$('input').val('')
			})
		}
	})



});
























	// function loadItems(){
	// 	ul.html("")
	
	// 	$.getJSON('/all', function(data){
			
	// 		$.each(data, function(key, value){
					
	// 			if(value.bought == false){
	// 				ul.append("<li id='"+value.id+"'>"+value.item+", "+value.quantity+"</li><button class='remove' id='"+value.id+"'>Remove</button></input><input class='quantity' placeholder='quantity' id='"+value.id+"'></input><input type='checkbox' class='bought' id='"+value.id+"'></input>")
	// 			}else{
	// 				ul.append("<li id='"+value.id+"'><strike>"+value.item+"</strike></li><button class='remove' id='"+value.id+"'>Remove</button><input type='checkbox' class='bought' id='"+value.id+"'></input>")
	// 			};

	// 		})
			
	// 		addListeners()

	// 	})
		
	// };

// function removeItem(itemID){
// 	$.post('/remove/'+itemID)
// };

// 	function addListeners(){
// 		$('button.remove').on('click', function(){
// 			var itemID = this.id
// 			$.post('/remove/'+itemID, function(){
// 				loadItems()
// 			})
// 		})

// 		$('input.bought').on('click', function(){
// 			var itemID = this.id
// 			$.post('/bought/'+itemID, function(){
// 				loadItems()
// 			})
// 		})

// 		$('input.quantity').on('keydown', function(e){
// 			var itemID = this.id
// 			if (e.keyCode==13){
// 				var quantity = $('input#'+itemID+'.quantity').val()
// 				$.post('quantity/'+itemID+"/"+quantity, function(){
// 					loadItems()
// 				})
				
// 				$('input#'+itemID+'.quantity').val('')
// 			}
// 		})
// 	};


// 	$('button.add').on('click', function(){
		
// 		var item = $('input.item').val()
// 		var itemView = new ItemView({item: item})
// 		$('ul').append(itemView.el)

		
// 	});

// 	$('input').on('keydown', function(e){
// 		if(e.keyCode ==13){
// 			var item = $('input.item').val()
// 			var itemView = new ItemView({item: item, quantity: 0})
			
// 			$('ul').append(itemView.el)
			
// 			$.post('/add/'+item, function(){

// 				$('input').val('')
// 			})
// 		}
// 	})



// });