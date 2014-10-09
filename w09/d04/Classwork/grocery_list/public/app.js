$(function(){
	var ItemModel = Backbone.Model.extend({
		urlRoot: '/items'
	});

	var ItemCollection = Backbone.Collection.extend({
		url: '/items',
		model: ItemModel
	});

	collection = new ItemCollection();

	var ListView = Backbone.View.extend({
		initialize: function() {
			this.listenTo(this.collection, 'add', this.addOne);

			collection.fetch();
		},

		addOne: function(item){
			var view = new ItemView({model: item});
			view.render();
			this.$el.append(view.el);
		}
	});

	var list = new ListView({ collection: collection, el: $('ul') });

	var ItemView = Backbone.View.extend({

		tagName: 'li',
		template: _.template($('#grocery_template').html() ),

		initialize: function(){
			this.listenTo(this.model, 'change', this.render)
			this.listenTo(this.model, 'destroy remove', this.remove)
		},

		events: { 
			'click .checkbox' : 'bought',
			'keypress .quantity': 'updateQuantity',
			'click .del' : 'delete'
		},

		bought: function(){
			this.model.set('checked', this.$el.children().prop('checked'));
			this.model.save();
		},

		updateQuantity: function(event){
			if (event.which == 13) {
				this.model.set('quantity', this.$el.find('.quantity').val());
				this.model.save();
			}
		},

		delete: function(){
			this.model.destroy();
		},

		render: function() {
			
			this.$el.html( this.template(this.model.attributes));

		}
	})

	var FormView = Backbone.View.extend({
		events: {
			'click button.btn' : 'create'
		},

		create: function(){
			var itemName = this.$el.find('input.add').val();

			this.collection.create({item: itemName, quantity: '1', checked: false});

			this.$el.find('input.add').val('');

		}
	})

	var formView = new FormView({ el: $('.form'), collection: collection});

})