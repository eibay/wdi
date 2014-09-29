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
	render: function(){
		this.$el.html( this.template( { car: this.model.toJSON() } ) );

		return this
	}
});

var CarListView = Backbone.View.extend({
	initialize: function(){
		// add is a Backbone event
		this.listenTo(this.collection, 'add', this.render);
		this.listenTo(this.collection, 'remove', this.render);
	},

	render: function(){
		// The plan is to create new instances of CarView inside this render function
		this.$el.empty();
		var self = this;
		_.each(self.collection.models, function(car){
			var carView = new CarView({ model: car });
			self.$el.append( carView.render().el  );
		})
		return this;
	}
})

// ***Collection***

var CarCollection = Backbone.Collection.extend({
	model: Car
});

var cars,
		listView,
		honda,
		toyota,
		ford,
		nissan,
		buick;

$(function(){

	var cars = new CarCollection();

	var listView = new CarListView({ collection: cars, el: $('#car-list') });

	var honda = new Car({ make: "Honda", type: "Civic", color: "Red" });
	var toyota = new Car({ make: "Toyota", type: "Corolla", color: "White" });
	var ford = new Car({ make: "Ford", type: "Fiesta", color: "Yellow" });
	var buick = new Car({ make: "Buick", type: "Le Sabre", color: "Blue" });
	var nissan = new Car({ make: "Nissan", type: "Sentra", color: "Silver" });

	cars.add(honda);
	cars.add(toyota);
	cars.add(ford);
	cars.add(buick);
	cars.add(nissan);
	
})
