	// var AppRouter = Backbone.Router.extend({
	// 	routes: {
	// 		'': 'main',
	// 	}
	// });

	// var appRouter = new AppRouter;


var ItemView = Backbone.View.extend({

	tagName: "li",

	events: {
		"click i.delete-button" : "destroy",
		"click i.up" : "upQuant",
		"click i.down" : "downQuant"
	},

	destroy: function() {
		this.model.destroy();
		$.ajax({
			url: '/delete',
			data: {toDeleteId: this.id},
			type: "DELETE",
			success: function(result){
			}
		});
		this.remove();
	},

	upQuant: function() {
		var thisView = this;
		$.ajax({
			url: '/list_up',
			data: {id: this.id},
			type: 'PUT',
			success: function(result){
			}
		})
		.done(function(res) {
			console.log(res)
			thisView.quantity = res;
			thisView.render();
		})
	},

	downQuant: function() {
		var thisView = this;
		$.ajax({
			url: '/list_down',
			data: {id: this.id},
			type: 'PUT',
			success: function(result){
			}
		})
		.done(function(res) {
			console.log(res)
			thisView.quantity = res;
			thisView.render();
		})
	},



	initialize: function(object) {
  		this.id = object.id;
  		this.item = object.item;
  		this.quantity = object.quantity;
  	},
  	render: function() {
  		var html = this.item + 
  		' <span id="' + this.id + '">' + this.quantity + '</span>' + 
  		' <i class="fa fa-caret-square-o-up up" id="' + this.id + '"></i> <i class="fa fa-caret-square-o-down down" id="' + this.id + '"></i> <i class="fa fa-trash delete-button" id="' + this.id + '"></i>'

  		this.$el.html(html);
  	}
})

function getItems() {
	$.get('/groceries', function(items) {
	
		_.each(items, function(i) {
			var itemView = new ItemView({id: i['id'], item: i['item'], quantity: i['quantity']})
			itemView.render();

			$('.to-buy').append(itemView.el);
		})
	})	
}

function createItem(item, quant) {	
	$.post('/add', {item: item, quantity: quant}).done(function(res) {
		console.log(res)
		jsonRes = JSON.parse(res);

		var itemView = new ItemView({id: jsonRes['id'], item: item, quantity: quant});
		itemView.render();

		$('.to-buy').append(itemView.el);
	});
};

// var ViewModel = new ViewModel.Backbone.extend({
// 	urlRoot: '/items'
// });

$(function(){

	getItems();

	$('#add-button').on('click', function() {
		createItem($('#item-name').val(), $('#item-quant').val());
	})

	$('.to-buy, .bought').sortable({connectWith: '.list'}).disableSelection();

	// $('.to-buy').on('sortupdate', function(event){
	// 	$.ajax({
	// 		url: '/list_update',
	// 		data: {item: event.target},
	// 		type: "PUT"
	// 		success: function(result){
	// 		}
	// 	});
	// 	debugger
	// });

	
	$('#eraser').droppable({
		drop: function(event, ui) {

			var id = ui.helper.children(0)[0].id
			$.ajax({
				url: '/delete',
				data: {toDeleteId: id},
				type: "DELETE",
				success: function(result){
				}
			});
			ui.helper[0].remove()
			$("#eraser").effect("shake", 500)
		}
	});

});




