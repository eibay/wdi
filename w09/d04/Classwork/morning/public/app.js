var ItemModel = Backbone.Model.extend({	
	urlRoot: "/items",

	// initialize: function(){
	// 	console.log("A new item Model has been made")

	// },

	defaults:{
		item: "", 
		quantity: 0,
	}

});

var ItemCollection = Backbone.Collection.extend({
  url: "/items",
  model: ItemModel
});


function addItem (item){
  
  var model = new ItemModel({item: item});
  model.save();

  var itemView = new ItemView({ model: model });
  itemView.render();
  $('ul').append(itemView.el)

};



// function removeItem(itemID){
// 	$.post('/remove/'+itemID)
// };

// function updateBought(itemID){
// 	$.post('/bought/'+itemID)
// };

// function updateQuantity(itemID, quantity){
// 	$.post('/quantity/'+ itemID + "/" + quantity)
// };

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
			var quantity = this.$('input.quantity').val()
			updateQuantity(id, quantity)
			
			$('input.quantity').val('')
			
			this.quantity = quantity
			this.render()
		}
	},

	initialize: function() { 
		console.log('a new list view has been created')
		// console.log(this.model)
		// this.item = opt.item
		// this.quantity = opt.quantity
		// this.render()
		// console.log(this)
		// this.listenTo(this.model, "change", this.render);
	},
	
	render: function() {
		// console.log(this.model)
		// console.log(this)
		this.$el.html( this.template(this.model.attributes) );
		// this.$el.html(this.template({item: this.item, quantity: this.quantity}))
	// return this
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
		var items = $.get('/items', function(data){
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
			addItem(item)
	 	}
	})



});


