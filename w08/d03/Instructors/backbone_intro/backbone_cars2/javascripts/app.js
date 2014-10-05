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
	tagName: 'li',
	template: _.template( $('#car_template').html() ),
	initialize: function() {
		this.listenTo(this.model, "remove", this.remove);
	},
	render: function(){
		this.$el.html( this.template( { car: this.model.toJSON() } ) );
	}
});

var CarListView = Backbone.View.extend({
	tagName: "ul",

	initialize: function(){
		// add is a Backbone event
		this.listenTo(this.collection, 'add', this.addOne);
	},

	addOne: function(car) {
		var carView = new CarView({ model: car });
		carView.render()
		this.$el.append(carView.el );
	}
})

// ***Collection***

var CarCollection = Backbone.Collection.extend({
	model: Car
});

var cars = new CarCollection();

var listView = new CarListView({ collection: cars, el: $('#car-list') });

<<<<<<< HEAD
	cars = new CarCollection();
=======
var honda = new Car({ make: "Honda", type: "Civic", color: "Red" });
var toyota = new Car({ make: "Toyota", type: "Corolla", color: "White" });
var ford = new Car({ make: "Ford", type: "Fiesta", color: "Yellow" });
var buick = new Car({ make: "Buick", type: "Le Sabre", color: "Blue" });
var nissan = new Car({ make: "Nissan", type: "Sentra", color: "Silver" });
>>>>>>> 4aa47d1397b899cd49e3dd53137bb03a9246d41d

cars.add(honda);
cars.add(toyota);
cars.add(ford);
cars.add(buick);
cars.add(nissan);
