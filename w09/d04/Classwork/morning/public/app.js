function removeItem(itemID){
	$.post('/remove/'+itemID)
};

function updateBought(itemID){
	$.post('/bought/'+itemID)
};

function updateQuantity(itemID, quantity){
	$.post('/quantity/'+ itemID + "/" + quantity)
};

var ItemView = Backbone.View.extend({
	
	tagName: 'li',

	events: {
		"click button.test" :"remove",
		"click input.bought" :"mark",
		"keydown input.quantity" :"quantityUpdate",
	},

	template: _.template( $("#template").html() ),

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

	quantityUpdate: function(e){
		var id = this.id
		if (e.keyCode == 13){
			var quantity = 5
			// console.log(quantity)
			// console.log($this.input #+id.val())
			// console.log(this.el$('input'))
			console.log(this.el$('input'))
			updateQuantity(id, quantity)
			// console.log(this.quantity)
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
	
		// var innards = "<h2>" + this.item + ", "+this.quantity+"</h2><input class='quantity' placeholder='quantity'></input><button class='test'>Remove</button><input type='checkbox' class='bought'></input>"
		// console.log(this)
		
		this.$el.html(this.template({item: this.item, quantity: this.quantity}))
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


	$('input').on('keydown', function(e){
		if(e.keyCode ==13){
			var item = $('input.item').val()
			
			$.post('/add/'+item, function(data){
				$('input').val('')
				var item = data.item;
				var quantity = data.quantity;
				var id = data.id

				var itemView = new ItemView({item: item, quantity: quantity, id: id})
				$('ul').append(itemView.el)
			}
		
	 	}
	})



});


