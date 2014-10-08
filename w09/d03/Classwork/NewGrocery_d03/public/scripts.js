console.log('scripts.js linked!!');
//Models
var Item = Backbone.Model.extend({
	urlRoot: '/items'	
});

// function getItems(item, quantity){
// 	var item = new Item({name: item, quantity: quantity});
// 	item.save();

// 	var itemView = new Item
// }

// function createItem(){
// 	$('#btn_grocery').on('click', function(){
// 		console.log('clicked #btn_grocery');
// 	})
// }







// var ItemCollection = Backbone.Collection.extend({
// 	url: "/items",
// 	model: ItemModel
// });
// collection = new ItemCollection();

// var ListView = Backbone.View.extend({
// 	initialize: function() {

// 	}
// })
// var item = new Item(
// 	{ 
// 		name: params['name'], 
// 		list: "list", 
// 		quantity: params['quantity'] 
// 	}
// ); // ~<<{{QUESTION}}>>~ where do i put this?


// //collection
// var ItemCollection = Backbone.Collection.extend({
// 	url: "/items",
// 	model: ItemModel
// });

// //views
// var ListView = Backbone.View.extend({
// 	initialize: function(){
// 		this.listenTo(this.collection, "add", this.addOne)
// 	},

// 	addOne: function(item) {
// 		var view = new ItemView({model:})
// 	}
// });
// var list = new ListView({ collection: collection, el: $('#ul_toBuy') });

// var FormView = Backbone.View.extend({
// 	events: {

// 	},

// 	create: function(){
// 		var itemName = this.$el.find('input[name="item-name"]').val();
// 		var quantity = this.$el.find('input[name="number"]').val();
// 		this.collection.create({ item: itemName, number: quantity });
// 	}
// });
// var formView = new FormView({ el: $(".form") });

var ItemView = Backbone.View.extend({
	tagName: 'li',

	// initialize: function(theInitObj){

	// 	console.log("new ItemView has been created");
	// 	this.name = theInitObj.name;
	// 	this.quantity = theInitObj.quantity;
		
	// },

	render: function(){
		
		var itemHTML = "";
		itemHTML += '<section id="' + this.model.get("id")
		itemHTML += '"><h5>' + this.model.get("name") + '</h5>'
		itemHTML += '<p>QTY: ' + this.model.get('quantity') + '</p>'
		itemHTML += '<a class="btn_increase" href="#">♠</a><a class="btn_decrease" href="#">♥</a>'
		itemHTML += '<button class="btn_delete">delete</button>'
		itemHTML += '</section>'

		this.$el.html(itemHTML)

	},

	events: {
		'click button.btn_delete' : 'destroy',
		'click a.btn_increase' : 'increase',
		'click a.btn_decrease' : 'decrease'
	}, 

	destroy: function(){
		$.ajax({
			url: '/delete',
			data: { id: this.id },
			type: 'DELETE'
		});
		this.remove();
	},

	increase: function(){
		var this_view = this; // oh i'm saving THIS like what neel said!

		$.ajax({
			url: '/increase',
			data: {id: event.target.parentNode.id},
			type: "PUT"
		}).done(function(response){

			this_view.quantity = response['quantity'];  // reset the value of the new view
			this_view.render(); // rerender with this

				////OLD COD for above\\\\\
				//////////////////////////

			// console.log('hello done function')
			// console.log(response); // see if its working
			// qty = response['quantity'];
			// console.log(qty); // see if its working

			// this_button.parent().children('p').text('QTY: '+ qty); //YASS! it works!
		});

	},

	decrease: function(){
		var this_view = this;
		$.ajax({
			url: '/decrease',
			data: {id: event.target.parentNode.id},
			type: "PUT"
		}).done(function(response){

			this_view.quantity = response['quantity'];
			this_view.render();
		});
	}
});

		//sortable stuff
		$("#ul_toBuy, #ul_bought" ).sortable( {connectWith: ".ul_lists"});

		//render all views
		getAndMakeViews();
		function getAndMakeViews(){
			$.get('/get_items', function(items){


				_.each(items, function(item){
					var item = new Item({id: item['id'], name: item['name'], quantity: item['quantity']});
					
					// make model instance, then pass into view upon creation
					// view will have this.model as a property.
					var view = new ItemView({model: item});
					view.render();

					$('#ul_toBuy').append(view.el);
			
				});

			});
		}
		// create grocery list item
		function addLastItem(jQueryParsedResponse){

			var lastItem = jQueryParsedResponse;

			var view = new ItemView(jQueryParsedResponse)
			view.render();
			$('#ul_toBuy').append(view.el);

		}




		//add button
		$('#btn_grocery').on('click', function(){
			console.log('clicked btn grocery?');



			//ajax post
			$.post( '/add', {name: $('#input_grocery').val(), quantity: $('#input_quantity').val()} ).done(function(response){
				
				console.log('ajax posted'); //#########################\\
				console.log('ajax got back the following: '); //########@@#>=-
				console.log(response); //##############################//		

				//create grocery list item
				addLastItem(response);
				// addDeleteEvent(); //sometimes works here, i think shoudl work here immediately..
				// addIncrease();
				// minusDecrease();	
			})



		});





		
		// function minusDecrease(){
		// 	$('.btn_decrease').on('click', function(){
		// 		console.log('decreasing');

		// 		var this_button = $(this); // oh i'm saving THIS like what neel said!
		// 		var qty = ""
		// 		$.ajax({
		// 			url: '/decrease',
		// 			data: {id: event.target.parentNode.id},
		// 			type: "PUT"
		// 		}).done(function(response){

		// 			console.log(response); // see if its working
		// 			qty = response['quantity'];
		// 			console.log(qty); // see if its working

		// 			this_button.parent().children('p').text('QTY: '+ qty); //YASS! it works!
		// 		});

		// 		//$(this).parent().children('p').html(qty); // why can't i do this? >>>>>>>>>!!! actually probably because  it's asynchronous, faster than  the ajax
		// 	})
		// }
		// minusDecrease();


// 		function addDeleteEvent(){
// 			$('.btn_delete').on('click', function(){
// 				console.log("deleting");
// 				$.ajax({
// 					url: '/delete',
// 					data: {id: event.target.parentNode.id},
// 					type: "DELETE"
// 				});
// 				$(this).parent().parent().remove(); //removes the li assoc with the btn immed

// 			});
// 		}
// function addIncrease(){
// 	$('.btn_increase').on('click', function(){
// 		console.log('increasing');

// 		var this_button = $(this); // oh i'm saving THIS like what neel said!
// 		var qty = ""
// 		$.ajax({
// 			url: '/increase',
// 			data: {id: event.target.parentNode.id},
// 			type: "PUT"
// 		}).done(function(response){

// 			console.log(response); // see if its working
// 			qty = response['quantity'];
// 			console.log(qty); // see if its working

// 			this_button.parent().children('p').text('QTY: '+ qty); //YASS! it works!
// 		});

// 		//$(this).parent().children('p').html(qty); // why can't i do this? >>>>>>>>>!!! actually probably because  it's asynchronous, faster than  the ajax
// 	})
// }
// addIncrease();	






