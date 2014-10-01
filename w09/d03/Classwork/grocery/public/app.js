$(function(){
	var ItemView = Backbone.View.extend({
		tagName:"li",
		events: {
			'click label.addquantity' : 'addQuantity',
			'click label.removequantity': 'removeQuantity'
		},
		
		addQuantity: function(ui){
			var id = this.item.id
			var that = this;
			$.ajax({
				type: "PUT",
				url: "/updatequantity",
				data:{id:id}
			}).done(function(response){
				that.item.quantity = response.quantity
				that.render()
			});
		},

		removeQuantity: function(ui){
			var id = this.item.id
			var that = this;
			$.ajax({
				type: "PUT",
				url: "/lowerquantity",
				data:{id:id}
			}).done(function(response){
				that.item.quantity = response.quantity
				that.render()
			});
		},

		initialize: function(grocery){
			this.item = grocery.item
			this.arrows = grocery.arrows
			// this.listenTo(this.model, 'change', this.render)
			// this.listenTo(this.model, 'destroy', this.remove)
		},

		render:function(){
			if(this.arrows == true){
				var innards = this.item.item+'<div class="quantity">'+this.item.quantity+'</div><label class="addquantity"><i class="fa fa-arrow-up"></i></label><label class="removequantity"><i class="fa fa-arrow-down"></i></label>';
			}	else{
				var innards = this.item.item+'<div class="quantity">'+this.item.quantity+'</div><label class="addquantity"></label><label class="removequantity"></label>';
			}
			this.$el.html(innards)
		}
	})

	var ItemModel = Backbone.Model.extend({
		urlRoot: '/items'
	  
	});

$.get('/groceries').done(function(response){

	_.each(response.need, function(item){
		
		var addItem = new ItemView({item: item, id: item.id, arrows:true})
		addItem.render()
		$('.list').append(addItem.el)
	})
	
	_.each(response.have, function(item){
		var addItem = new ItemView({item:{id: item.id, item:item.item, quantity:''}, id: item.id, arrows:false})
		addItem.render()
		$('.list2').append(addItem.el)
	})
})
$('#addIt').on('click', function(){
	addToList($('#additem').val(), $('#quantity').val())
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
			$.ajax({
				type: "PUT",
				url: "/updateposition",
				data:{id:child.id, position: index, bought:false, quantity:quantity}
			});

		})
	}
	
	else if(which == "list2"){
		ui.item.children()[0].innerHTML = '';
		ui.item.children()[1].innerHTML = '';
		ui.item.children()[2].innerHTML = '';

		_.each(have, function(child, index){
			$.ajax({
				type: "PUT",
				url: "/updateposition",
				data:{id:child.id, position: index, bought:true, quantity:0}
			});
		})
	}
});

$( ".trash" ).droppable({
	drop: function(event, ui) {
		ui.draggable.remove()
		$.ajax({
			type: "DELETE",
			url: "/deleteitem",
			data:{id:ui.draggable.context.id}
		});
		$('.trash').css( "color", "red")
		setTimeout(function(){
			$('.trash').css( "color", "black")
		},500)
		$( ".trash" ).effect("shake", 500)
	}
});

function addToList(item, quantity){
	$.post('/add', {item:item, quantity:quantity}).done(function(response){
		console.log(response)
		var addItem = new ItemView({item: response, id: response.id} )
		addItem.render()
		$('.list').append(addItem.el)
		$('#additem').val('');
		$('#quantity').val('')

	})
}
})

