$(function() {

	var ItemView = Backbone.View.extend({

		events: {
			"click button.delete" : "destroy",
			"keydown input.quantity" : "updateQuantity",
			"click input.purchased" : "updatePurchased",
		},

		template: _.template( $("#template").html() ),

		destroy: function() {
			this.model.destroy()
		},

		updateQuantity: function() {
			if (arguments[0].keyCode == 13) {
	    	this.model.set('quantity', this.$el.find(".quantity").val());
	    	this.model.save();
	    }
  	},

  	updatePurchased: function() {
  		this.model.set("checked", this.$el.find(".purchased").is(":checked"));
  		this.model.save();
  	},

		tagName: "li",

		initialize: function() {
			this.listenTo(this.model, "change", this.render);
    	this.listenTo(this.model, "destroy", this.remove);
		},

		render: function() {			
			this.$el.html( this.template(this.model.attributes) );
		}
	})

	// $("input.item-entry").keydown(createListItem)

	// function createListItem(feed) {

	// 	if (feed.keyCode == 13) {
	// 		var item = feed.target.value
	// 		feed.target.value = ""
	// 		postItem(item)
	// 	}
	// }


	var ItemModel = Backbone.Model.extend({
		urlRoot: "/items",
	})

	var ItemCollection = Backbone.Collection.extend({
		url: "/items",
		model: ItemModel
	})

	var collection = new ItemCollection()


	var ListView = Backbone.View.extend({

		initialize: function() {
			this.listenTo(this.collection, "add", this.addOne)

			collection.fetch()
		},

		addOne: function(item) {
			var view = new ItemView({model: item})
			view.render()
			this.$el.append(view.el)
		}
	})

	var list = new ListView({collection: collection, el: $("ul")})

	var FormView = Backbone.View.extend({

		events: {
			"keydown input.item-entry" : "create"
		},

		create: function(feed) {
			if (feed.keyCode == 13) {
				var product = feed.target.value
				var quantity = 1
				var checked = false

				this.collection.create({checked: checked, quantity: quantity, product: product})
			}
		}

	})

	var formView = new FormView({ el: $("body"), collection: collection })


	// collection.fetch({ success: function() {
	//   collection.models.forEach(function(item) {
	//     var view = new ItemView({model: item});

	//     view.render();

	//     $(".list").append(view.el);  
	//   })
	// }});

	// function postItem(product) {
	// 	$.ajax({
	// 		method: "POST",
	// 		url: "http://127.0.0.1:4567/additem",
	// 		data: {item: product, quantity: 1, },
	// 		success: makeNewItem,
	// 	})
	// }

	// function makeNewItem(feed) {
	// 	var item = JSON.parse(feed)
	// 	var model = new ItemModel(item);
	// 	createListItemElement(model)
	// 	$("ul").find(".quantity").last().focus()
	// }

	// function createListItemElement(model) {
	// 	debugger
	// 	var view = new ItemView({model: model});
	// 	view.render()
	// 	$("ul.list").append(view.$el)
	// }

	

})