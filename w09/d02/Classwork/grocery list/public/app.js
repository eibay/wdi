var TodoModel = Backbone.Model.extend({
	urlRoot: "/items"
});


// function newModel(items,quantities){
// 	var model = new TodoModel({item: items, quantity: quantities});
// 	model.save();

// 	var view = new TodoView({ model: model })
// 	view.render();
// 	$("#list").append(view.el);
// }

var TodoCollection = Backbone.Collection.extend({
	url: "/items",
	model: TodoModel
});

var collection = new TodoCollection();

var ListView = Backbone.View.extend({
	initialize: function() {
		this.listenTo(this.collection, "add", this.addOne);
		collection.fetch();
	},

	addOne: function(a){
		console.log("add one triggered")
		var oldView = new TodoView ({ model : a });
		oldView.render();
		console.log(oldView.el)
		this.$el.append(oldView.el)
	}
})

var list = new ListView({ collection: collection, el: $("ul") })

var TodoView = Backbone.View.extend({
	tagName: "li",

	template: _.template( $("#template").html() ),
	
	events: {
		"click button.delete" : "destroy",
	},
	destroy: function(){
		this.model.destroy();
	},
	initialize: function(){
		this.listenTo(this.model, "destroy", this.remove);
		console.log("a new todo VIEW has been created")
	},
	render: function() {
		this.$el.html( this.template(this.model.attributes) );
	}, 
})

var FormView = Backbone.View.extend({
	events: {
		"click button.add" : "createSomething"
	},

	createSomething: function(){
		console.log("created!")
		var itemName = this.$el.find("input[id='list_item']").val()
		var quantity = this.$el.find("input[id='quantity']").val()
		this.collection.create({ item: itemName, quantity: quantity});
	}
})

var formView = new FormView({ el: $(".form"), collection: collection})


