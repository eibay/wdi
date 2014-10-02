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
		this.listenTo(this.model, 'destroy', this.remove)
		this.template = _.template($('#need-template').html())
		this.template2 = _.template($('#bought-template').html())
	},

	render:function(){
		if(this.model.attributes.bought == false){
			var innards = this.template({item: this.model.toJSON()})
		}	else{
			var innards = this.template2({item: this.model.toJSON()})
		}
		this.$el.html(innards);
	}
})

var ItemModel = Backbone.Model.extend({
	urlRoot: '/items'
});

var ItemCollection = Backbone.Collection.extend({
	url: '/items',
	model: ItemModel
});

$(function(){
	myItems = new ItemCollection()

	myItems.fetch({ success: function() {
		_.each(myItems.models, function(item){

			var addItem = new ItemView({model: item, id:item.attributes.id});
			addItem.render();
			if(item.attributes.bought==false){
				$('.list').append(addItem.el)
			}else{
				$('.list2').append(addItem.el)
			}
		})
	}});

	$('#addIt').on('click', function(){
		var newItem = new ItemModel()
		newItem.set('item', $('#additem').val())
		newItem.set('bought', false)
		newItem.set('quantity', $('#quantity').val())
		newItem.save({}, {
			success: function(response){
				var renderItem = new ItemView({model: newItem, id:response.id})
				renderItem.render()
				$('.list').append(renderItem.el)      
			}
		});
		myItems.add(newItem)
		
	})
	
	$('.list, .list2').sortable({connectWith:'.lists'}).disableSelection();
	$('.list, .list2').on('sortupdate',function(event, ui){

		var need = $('.list').children()
		var have = $('.list2').children()
		var which=event.target.className.split(' ')[0]

		if(which == "list"){
			_.each(need, function(child, index){

				quantity=parseInt(child.children[0].innerText)
				if(child.children[0].innerText == ''){
					quantity = 1;
					ui.item.children()[0].innerHTML = '1';
					ui.item.children()[1].innerHTML = '<i class="fa fa-arrow-up"></i>';
					ui.item.children()[2].innerHTML = '<i class="fa fa-arrow-down"></i>';
				}
				var theItem = myItems.get(child.id)
				theItem.set('position', index)
				theItem.set('bought', false)
				theItem.save()
			})
		}

		else if(which == "list2"){
			ui.item.children()[0].innerHTML = '';
			ui.item.children()[1].innerHTML = '';
			ui.item.children()[2].innerHTML = '';

			_.each(have, function(child, index){
				var theItem = myItems.get(child.id)
				theItem.set('position', index)
				theItem.set('bought', true)
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

