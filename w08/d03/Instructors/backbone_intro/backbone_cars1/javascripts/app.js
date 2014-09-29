// ***Model***

var Car = Backbone.Model.extend({
	initialize: function(){
		console.log("A new car has been made")
	},

	defaults:{
		make: "",
		type: "",
		color: "",
	}

});

// ***View***

var CarView = Backbone.View.extend({
	initialize: function(){
		this.listenTo(this.model, 'change', this.render)
	},

	template: _.template('<h2> <%= make %> <%= type %> </h2> <h3> <%= color %> </h2>'),

	render: function(){
		this.$el.empty();
		this.$el.html( this.template(this.model.attributes) );

		return this;
	}
});

var car;
var carView;

$(function(){

	var car = new Car({ make: "Honda", type: "Civic", color: "Red" });

	var carView = new CarView({ model: car, el: $("#car-holder") });

	carView.render();

})
