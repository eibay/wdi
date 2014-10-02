var TodoModel = Backbone.Model.extend({
	urlRoot: "/items"
});


function newModel(items,quantities){
	var model = new TodoModel({item: items, quantity: quantities});
	model.save();

	var view = new TodoView({ model: model })
	view.render();
	$("#list").append(view.el);
}

var TodoCollection = Backbone.Collection.extend({
	url: "/items",
	model: TodoModel
});

collection = new TodoCollection();

collection.fetch({ success: function() {
	collection.models.forEach(function(a) {	
		var oldView = new TodoView ({ model: a });
		oldView.render();
		$("#list").append(oldView.el)
	})
}})

var TodoView = Backbone.View.extend({
	tagName: "li",
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
		var innards = this.model.get("item") + " " + this.model.get("quantity") + "<button class='delete' id="+ this.id + "> X </button>"
		this.$el.html(innards)
	}, 
})
$(document).ready(function(){
	var button = $("#add").on("click", function(){
		var item = $("input#list_item").val();
		var quantity = $("input#quantity").val();
		newModel(item,quantity)
	});
})