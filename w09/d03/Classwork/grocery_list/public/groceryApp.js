
var ItemView = Backbone.View.extend({

	tagName: "li",

	template: _.template( $('#template').html() ),

	events: {
		"click i.delete-button" : "destroy",
		"click i.up" : "upQuant",
		"click i.down" : "downQuant"
	},

	destroy: function() {
		this.model.destroy();
	},

	upQuant: function() {
		// debugger
		this.model.set('quantity', Number(this.$el.children()[0].innerText) + 1);
		this.model.save()
	},

	downQuant: function() {
		// debugger
		this.model.set('quantity', Number(this.$el.children()[0].innerText) - 1);
		this.model.save()
	},

	initialize: function(object) {
		this.listenTo(this.model, "change", this.render);
		this.listenTo(this.model, "destroy remove", this.remove);
  	},

  	render: function() {
  		this.$el.html(this.template(this.model.attributes));
  	}
})

var ItemModel = Backbone.Model.extend({
	urlRoot: '/items'
});

var ItemCollection = Backbone.Collection.extend({
	url: "/items",
	model: ItemModel
});

collection = new ItemCollection()

var ListView = Backbone.View.extend({
	initialize: function() {
		this.listenTo(this.collection, "add", this.addOne);

		collection.fetch();
	},

	addOne: function(item) {
		var view = new ItemView({model: item});
		view.render();
		this.$el.append(view.el)
	}
});

var list = new ListView({ collection: collection, el: $(".to-buy") });

var FormView = Backbone.View.extend({
	events: {
		"click button#add-button" : "create"
	},

	create: function() {
		var item = this.$el.find('input[name="item-name"]').val();
    	var quantity = this.$el.find('input[name="item-quant"]').val();

		this.collection.create({ item: item, quantity: quantity})
	}
});

var formView = new FormView({ el: $(".form"), collection: collection })

$('.to-buy, .bought').sortable({connectWith: '.list'}).disableSelection();

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



