var ItemView = Backbone.View.extend({
	tagName:"li",
	events: {
		'click label.addquantity' : 'addQuantity',
		'click label.removequantity': 'removeQuantity'
	},

	addQuantity: function(){
		var add = this.model.set('quantity', parseInt(this.model.attributes.quantity)+1)
		add.save()
	},

	removeQuantity: function(){
		var add = this.model.set('quantity', parseInt(this.model.attributes.quantity)-1)
		add.save()
	},

	initialize: function(){
		this.listenTo(this.model, 'change', this.render)
		this.listenTo(this.model, 'destroy remove', this.remove)
		this.template = _.template($('#need-template').html())
	},

	render:function(){
		var compile = this.template({item: this.model.toJSON()})
		this.$el.html(compile);
	}
})

var ItemModel = Backbone.Model.extend({
	urlRoot: '/items'
});

var ItemCollection = Backbone.Collection.extend({
	url: '/items',
	model: ItemModel
});

var ListView = Backbone.View.extend({
	initialize: function(){
		this.listenTo(this.collection, "add", this.addOne)
		this.collection.fetch()
	},
	addOne: function(item){
		var view = new ItemView({model: item, id:item.id})
		view.render()
		if(item.attributes.bought==false){
			$('.list').append(view.el)
		}else{
			$('.list2').append(view.el)
		}

	}

})

var FormView = Backbone.View.extend({
	events: {
		'click button.addIt' : 'create',
	},
	create: function() {
		console.log('hello')
		var itemName = $('#additem').val();
		var quantity = $('#quantity').val()
		this.collection.create({item: itemName, quantity: quantity, bought: false});
	},
	initialize: function(){
		console.log(this.collection)
		console.log(this.events)

	}
});



$(function(){
	var myItems = new ItemCollection()
	var viewItems = new ListView({collection: myItems})
	var formView = new FormView({el: $(".form"), collection: myItems})

$('.list, .list2').sortable({connectWith:'.lists'}).disableSelection();
$('.list, .list2').on('sortupdate',function(event, ui){

	var need = $('.list').children()
	var have = $('.list2').children()
	var which=event.target.className.split(' ')[0]

	if(which == "list"){
		_.each(need, function(child, index){
			quantity=parseInt(child.children[0].innerText)
			var theItem = myItems.get(child.id)
			theItem.set('position', index)
			theItem.set('bought', false)
			theItem.set('quantity', quantity)
			theItem.save()
		})
	}

	else if(which == "list2"){
		_.each(have, function(child, index){
			var theItem = myItems.get(child.id)
			theItem.set('position', index)
			theItem.set('bought', true)
			theItem.set('quantity', 1)
			theItem.save()
		})
	}
});

$( ".trash" ).droppable({
	drop: function(event, ui) {
		var theItem = myItems.get(ui.draggable.context.id)
		theItem.destroy()
		$('.trash').css( "color", "red")
		setTimeout(function(){
			$('.trash').css( "color", "black")
		},500)
		$( ".trash" ).effect("shake", 500)
	}
});
})

