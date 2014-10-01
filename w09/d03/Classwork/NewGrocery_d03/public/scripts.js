console.log('scripts.js linked!!');
var ItemView = Backbone.View.extend({
	tagName: 'li',

	initialize: function(theInitObj){
		console.log("new ItemView has been created");
		this.name = theInitObj.name;
		this.quantity = theInitObj.quantity;
		
	},

	render: function(){
		
		var itemHTML = "";
		itemHTML += '<section id="' + this.id
		itemHTML += '"><h5>' + this.name + '</h5>'
		itemHTML += '<p>QTY: ' + this.quantity + '</p>'
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



		//create grocery list item
		function addLastItem(jQueryParsedResponse){

			var lastItem = jQueryParsedResponse;

			var view = new ItemView(jQueryParsedResponse)
			view.render();
			$('#ul_toBuy').append(view.el);

			// var lastItemList = ""
			// lastItemList += '<li><section id="' + lastItem['id']
			// 	lastItemList += '"><h5>' + lastItem['name'] + '</h5>'
			// 	lastItemList += '<p>QTY: ' + lastItem['quantity'] + '</p>'
			// 	lastItemList += '<a class="btn_increase" href="#">♠</a><a class="btn_decrease" href="#">♥</a>'
			// 	lastItemList += '<button class="btn_delete">delete</button>'
			// lastItemList += '</section></li>'

			// $('#ul_toBuy').append(lastItemList);
		}


		var ItemCollection = Backbone.Collection.extend({
			url: "/items",
			model: ItemModel
		})
		
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



function getAndMakeViews(){
	$.get('/get_items', function(items){


		_.each(items, function(item){
			var view = new ItemView({id: item['id'], name: item['name'], quantity: item['quantity']})
			view.render();

			$('#ul_toBuy').append(view.el);
	
		});

	});
}



