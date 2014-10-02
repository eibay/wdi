$(function(){
	var ItemModel = Backbone.Model.extend({
		urlRoot: '/items'
	});

	var ItemCollection = Backbone.Collection.extend({
		url: '/items',
		model: ItemModel
	});

	collection = new ItemCollection();

	collection.fetch({ success: function() {
		collection.models.forEach(function(item){
			var view = new ItemView({model: item});

			view.render();

			$('ul').append(view.el);
		})
	}});

	var ItemView = Backbone.View.extend({

		tagName: 'li',

// init can take a hash of data in function where you send in id, item, etc
		initialize: function(){
			this.listenTo(this.model, 'change', this.render)
			this.listenTo(this.model, 'destroy', this.remove)
		},

// add event listeners
		events: { 
			'click .checkbox' : 'bought',
			'keypress .quantity': 'updateQuantity',
			'click .del' : 'delete'
		},

		bought: function(){
			this.model.set('checked', this.$el.children().prop('checked'))
			this.model.save();
			// saveState(this.$el.attr('id'), 'checked', this.$el.children().prop('checked'));
			// if (this.$el.children().prop('checked') == true) {
			// 	this.$el.css('textDecoration', 'line-through');
			// 	this.$el.animate({color: '#c0c0c0'}, 600)
			// } else {
			// 	this.$el.css('textDecoration', '');
			// 	this.$el.animate({color: '#000'}, 600)
			// }
			// this.$el.css('textDecoration', function() {
			// 		return this.checked ? 'line-through' : "";
			// 	})
			// this.$el.animate({color: '#c0c0c0'}, 600)
		},

		updateQuantity: function(event){
			if (event.which == 13) {
				this.model.set('quantity', this.$el.find('.quantity').val());
				this.model.save();
				// saveState(this.$el.attr('id'), 'quantity', this.$el.find('.quantity').val());
			}
		},

		delete: function(){
			this.model.destroy();
			// $.ajax({url: 'http://127.0.0.1:4567/item', type: 'DELETE', data: {item: this.$el.attr('id')}
			// });
			// this.$el.fadeOut(500, function(){
			//  this.remove();
			// });
		},

// render view
		render: function() {
			var innards = '<input class="checkbox" id="' + this.model.attributes.id + '" type="checkbox"><span>' + this.model.attributes.item + '</span><input class="quantity" id="' + this.model.attributes.id + '" type="text" value="' + this.model.attributes.quantity + '"> <button class="btn del" id="' + this.model.attributes.id + '">X</button>';
			this.$el.html(innards);

			if (this.model.attributes.checked == true) {
				this.$el.find('input[type="checkbox"]').prop('checked',true)
				this.$el.css('textDecoration', 'line-through');
				this.$el.animate({color: '#c0c0c0'}, 600)
			} else {
				this.$el.css('textDecoration', '');
				this.$el.animate({color: '#000'}, 600)
			}		
		}
	})

// app
	// function lister(list){
	// 	for (var i = 0; i < list.length; i++) {
	// 		var model = new ItemModel({
	// 			id: list[i].id,
	// 			item: list[i].item,
	// 			quantity: list[i].quantity,
	// 			checked: list[i].checked
	// 		})

	// 		var view = new ItemView({
	// 			model: model
	// 		});

	// 		view.render();

	// 		$('ul').append(view.el);
			// $('ul').append('<li class="item"><input class="checkbox" id="' + list[i]["id"] + '" type="checkbox">' + list[i]["item"] + ' <input class="quantity" id="' + list[i]["id"] + 'type="text" value="' + list[i]["quantity"] + '"> <button class="btn del" id="' + list[i]["id"] + '">X</button></li>');
			
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
	// 	}
	// }

	// function saveState(item, value, state){
	// 	$.ajax({url: '/item', type: 'PUT', data: {item: item, value: value, state: state}})
	// }

	// $.get('http://127.0.0.1:4567/list', function(items){
	// 	lister(items);
	// });

	$('button').on('click', function(){	
		var item = $('input').val()
		var model = new ItemModel({
			item: item,
			quantity: '1'
		})
		model.save();
		var view = new ItemView({
			model: model
		})	
		$('ul').append(view.el);
		// $.post('http://127.0.0.1:4567/item', item, function(data){
		// 	lister(data);
		// });
		$('input.add').val('');
	});
})