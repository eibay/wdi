////////////////////////////////////

var ItemView = Backbone.View.extend({

	tagName: 'li',

	template: _.template( $("#template").html() ),

	events: {
        "click button.delete": "destroy",
        "click input.checkbox": "linethrough",
        "enter input.quantity": "quantityupdate" //couldn't make this happen when hit enter
    },

	initialize: function(someObj){
		this.listenTo(this.model, "change", this.render);
    	// this.listenTo(this.model, "destroy remove", this.remove); //the thing is my line-through will destroy data from database so once i click it dessapears
		// this.id = someObj.id;
		// this.name　= someObj.name;
		// this.quantity　= someObj.quantity;
	},

	render: function(){
		this.$el.html( this.template(this.model.attributes) );
		// var innards = $("<span>" + this.model.get('name') + "</span>" + "<button class='delete' id='" + this.model.get('id') + "'>X</button>" + "<input type='checkbox' class='checkbox' id='" + this.model.get('id') + "'>" + "<input type='text' class='quantity' placeholder='" + this.model.get('quantity') + "' id='" + this.model.get('id') + "' style='width: 40px;'>");
		// this.$el.html(innards);
	},
	//I don't get how to use template
    destroy: function(){
    	this.model.destroy();
    	this.remove();
    	// deleteItem();
    },

    linethrough: function(){
    	debugger
    	this.$el[0].children[0].style.textDecoration = "line-through",
    	this.model.destroy();
    	// lineThrough();
    },

    quantityupdate: function(){
    	console.log('updateee');
    	this.model.set({id: this.$el.find('.quantity'), quantity: this.$el.find('.quantity').val()});
    	this.model.save();
    	// quantityUpdate();
    },

    processKey: function(e){ 
  		if(e.which === 13) { // enter key
    		this.submit();
  		};
	}
});

var ItemModel = Backbone.Model.extend({
  urlRoot: "/items"
});

var ItemCollection = Backbone.Collection.extend({
  url: "/items",
  model: ItemModel
});

collection = new ItemCollection();

////////////////////////////////////

function quantityUpdate(){

	$('input.quantity').pressEnter(function(){
		console.log('Enterrr');
		var quantity = $('input.quantity')[0].value;
		var id = $(this).parent('li')[0].id;
		$.ajax({url: "http://127.0.0.1:4567/update", type: 'PUT', data: {id: id, quantity: quantity}});
		$(this)[0].value = "";
		$(this).attr('placeholder', quantity);
	});
};

////////////////////////////////////

function lineThrough(){

	$('.checkbox').click(function(){
		console.log("linethroughhh");
		var text = $(this).siblings('span')[0];
		$(text).css('text-decoration', 'line-through');
		var id = this.id;
		$.ajax({url: "http://127.0.0.1:4567/delete", type: 'DELETE', data: {id: id}});
	});

};

////////////////////////////////////

function renderList(array){

	for(var i=0;i<array.length;i++) {
		var item = new ItemModel({
				id: array[i].id,
				name: array[i].name,
				quantity: array[i].quantity,

			});

		var view = new ItemView({model: item});
		view.render();
		$('.groceries').append(view.el);
		// var li = document.createElement('li');
		// var delete_button = document.createElement('button');
		// var checkbox = document.createElement('input');
		// var span = document.createElement('span');
		// var quantity = document.createElement('input');
		// $(delete_button).attr('class', 'delete');
		// $(delete_button).attr('id', array[i].name);
		// $(delete_button).text('X');
		// $(checkbox).attr({type: 'checkbox', class: 'checkbox', id: array[i].id});
		// $(quantity).attr({type: 'text', class: 'quantity', placeholder: array[i].quantity, id: array[i].id});
		// $(quantity).css('width', '40');
		// $(span).text(array[i].name);
		// $(li).attr('id', array[i].id);
		// $(li).append(span);
		// $(li).append(delete_button);
		// $(li).append(checkbox);
		// $(li).append(quantity);
		// $('.groceries').append(li);
	};

};

////////////////////////////////////

// function createItem(item, quantity){

// 	var li = document.createElement('li');
// 	var delete_button = document.createElement('button');
// 	var checkbox = document.createElement('input');
// 	var span = document.createElement('span');
// 	var quantity = document.createElement('input');
// 	$(delete_button).attr({class: 'delete', id: item});
// 	$(delete_button).text('X');
// 	$(checkbox).attr({type: 'checkbox', class: 'checkbox', id: item});
// 	$(quantity).attr({type: 'text', class: 'quantity'});
// 	$(quantity).css('width', '40');
// 	$(quantity).attr({placeholder: this.quantity, id: item});
// 	$(span).text(item);
// 	$(li).attr('id', item);
// 	$(li).append(span);
// 	$(li).append(delete_button);
// 	$(li).append(checkbox);
// 	$(li).append(quantity);
// 	$('.groceries').append(li);

// };

////////////////////////////////////

function deleteItem(){

	$('.delete').click(function(){
		console.log("deleteee");
		var id = this.id;
		$.ajax({url: "http://127.0.0.1:4567/delete", type: 'DELETE', data: {id: id}});
		$(this).parent('li')[0].remove();
	});

};

////////////////////////////////////

function addItem(){

	$('.add').click(function(){
		console.log('addddd');
		var input = $('input')[0].value;
		var quantity = $('input')[1].value;
		var quantity_num = parseInt(quantity);
		var model = new ItemModel({name: input, quantity: quantity_num});

		model.save();
		var view = new ItemView({ model: model });
		view.render();
		$('.groceries').append(view.el);
		$('input')[0].value = "";
		$('input')[1].value = "";
		// $.post("http://127.0.0.1:4567/items", {name: input, quantity: quantity_num}, function(id){

		// 	// createItem(input, quantity_num);

		// 	var view = new ItemView({
		// 		id: id,
		// 		name: input,
		// 		quantity: quantity_num,
		// 	});
		// 	view.render();
		// 	$('.groceries').append(view.el);

		// 	$('input')[0].value = "";
		// 	$('input')[1].value = "";
		// 	// deleteItem();
		// 	// lineThrough();
		// });

	});

};

////////////////////////////////////

$.fn.pressEnter = function(fn) {  

    return this.each(function() {  
        $(this).bind('enterPress', fn);
        $(this).keyup(function(e){
            if(e.keyCode == 13)
            {
              $(this).trigger("enterPress");
            }
        })
    });  
 };

////////////////////////////////////

  $('input').keyup(function(e){
   if(e.keyCode == 13){
      $(this).trigger('enter');
   }
 });

////////////////////////////////////

$.ajax({url: "http://127.0.0.1:4567/ajax", type: "GET", 
	success: function(data){
	var items = JSON.parse(data);
	renderList(items);
	addItem();
	// quantityUpdate();
	// deleteItem();
	// lineThrough();
}});
