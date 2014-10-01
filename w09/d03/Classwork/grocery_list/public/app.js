$(function(){
// Backbone version
	var ItemView = Backbone.View.extend({

		tagName: 'li',

// init can take a hash of data in function where you send in id, item, etc
		initialize: function(someObj){
			this.quantity = someObj.quantity;
			this.item = someObj.item;
		},

// add event listeners
		events: { 
			'click .checkbox' : 'bought',
			'keypress .quantity': 'updateQuantity',
			'click .del' : 'delete'
		},

		bought: function(){
			saveState(this.$el.attr('id'), 'checked', this.$el.children().prop('checked'));
			if (this.$el.children().prop('checked') == true) {
				this.$el.css('textDecoration', 'line-through');
				this.$el.animate({color: '#c0c0c0'}, 600)
			} else {
				this.$el.css('textDecoration', '');
				this.$el.animate({color: '#000'}, 600)
			}
			// this.$el.css('textDecoration', function() {
			// 		return this.checked ? 'line-through' : "";
			// 	})
			// this.$el.animate({color: '#c0c0c0'}, 600)
		},

		updateQuantity: function(event){
				if (event.which == 13) {
					saveState(this.$el.attr('id'), 'quantity', this.$el.find('.quantity').val());
				}
		},

		delete: function(){
			$.ajax({url: 'http://127.0.0.1:4567/item', type: 'DELETE', data: {item: this.$el.attr('id')}
			});
			this.$el.fadeOut(500, function(){
			 this.remove();
			});
		},

// render view
		render: function() {
			var innards = '<input class="checkbox" id="' + this.id + '" type="checkbox"><span>' + this.item + '</span><input class="quantity" id="' + this.id + '" type="text" value="' + this.quantity + '"> <button class="btn del" id="' + this.id + '">X</button>';
		this.$el.html(innards);
		}
	})

// app
	function lister(list){
		for (var i = 0; i < list.length; i++) {
			var view = new ItemView({
				id: list[i].id,
				item: list[i].item,
				quantity: list[i].quantity
			});

			view.render();

			$('ul').append(view.el);
			// $('ul').append('<li class="item"><input class="checkbox" id="' + list[i]["id"] + '" type="checkbox">' + list[i]["item"] + ' <input class="quantity" id="' + list[i]["id"] + 'type="text" value="' + list[i]["quantity"] + '"> <button class="btn del" id="' + list[i]["id"] + '">X</button></li>');
			if (list[i]["checked"] == true) {
				$('#' + list[i]["id"] + '.checkbox').prop('checked', true);
				$('#' + list[i]["id"]).css('textDecoration', 'line-through');
				$('#' + list[i]["id"]).css('color', '#c0c0c0');	
			}
			// $('input#' + list[i]["id"]).click(function(){
			// 	saveState($(this).attr('id'), 'checked', $(this).prop('checked'));
			// 	var that = this;
			// 	$(this).parent().css('textDecoration', function() {
			// 		return that.checked ? 'line-through' : "";
			// 	})
			// 	$(this).parent().animate({color: '#c0c0c0'}, 600)
			// })
			// $('.quantity').keypress(function(event){
			// 	if (event.which == 13) {
			// 		saveState($(this).attr('id'), 'quantity', $(this).val());
			// 	}
			// })	
			// $('.del').on('click', function(){
			// 	$.ajax({url: 'http://127.0.0.1:4567/item', type: 'DELETE', data: {item: $(this).attr('id')}
			// });
			// 	$(this).parent().remove();
			// })
		}
	}

	function saveState(item, value, state){
		$.ajax({url: '/item', type: 'PUT', data: {item: item, value: value, state: state}})
	}

	$.get('http://127.0.0.1:4567/list', function(items){
		lister(items);
	});

	$('button').on('click', function(){	
		var item = $('input').val()	
		$.post('http://127.0.0.1:4567/item', item, function(data){
			lister(data);
		});
		$('input.add').val('');
	});
})