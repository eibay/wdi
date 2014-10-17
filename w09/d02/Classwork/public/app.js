////////////////////////////////////

function lineThrough(){

	$('.checkbox').click(function(){
		console.log("linethroughhh");
		var text = $(this).siblings('span')[0];
		$(text).css('text-decoration', 'line-through');
	});

}

////////////////////////////////////

function changeQuantity(){

	$('input.quantity').keypress(function(){
		
	});

}

////////////////////////////////////

// function renderList(items){

// 	for(var i=0;i<items.length;i++) {
// 		var li = document.createElement('li');
// 		var delete_button = document.createElement('button');
// 		$(delete_button).attr('class', 'delete');
// 		$(delete_button).attr('id', items[i].name);
// 		$(delete_button).text('Delete');
// 		$(li).text("Name: " + items[i].name);
// 		$(li).attr('id', items[i].name);
// 		$(li).append(delete_button);
// 		$('.groceries').append(li);
// 	};
// };

////////////////////////////////////

function createItem(item, quantity){

	var li = document.createElement('li');
	var delete_button = document.createElement('button');
	var checkbox = document.createElement('input');
	var span = document.createElement('span');
	var quantity = document.createElement('input');
	$(delete_button).attr('class', 'delete');
	$(delete_button).attr('id', item);
	$(delete_button).text('X');
	$(checkbox).attr('type', 'checkbox');
	$(checkbox).attr('class', 'checkbox');
	$(checkbox).attr('id', item);
	$(quantity).attr('type', 'text');
	$(quantity).attr('class', 'quantity');
	$(quantity).css('width', '40');
	$(quantity).attr('placeholder', quantity);
	$(quantity).attr('id', item);
	$(span).text(item);
	$(li).attr('id', item);
	$(li).append(span);
	$(li).append(delete_button);
	$(li).append(checkbox);
	$(li).append(quantity);
	$('.groceries').append(li);

};

////////////////////////////////////

function deleteItem(){

	$('.delete').click(function(){
		console.log("deleteee");
		var name = this.id;
		$.ajax({url: "http://127.0.0.1:4567/delete", type: 'DELETE', data: {name: name}});
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

		$.post("http://127.0.0.1:4567/add", {name: input, quantity: quantity_num}, function(){
			debugger
			createItem(input, quantity_num);
			input.value = "";
			quantity.value = "";
			deleteItem();
			lineThrough();
		});

	});

};

////////////////////////////////////

$(function(){

	$.ajax({url: "http://127.0.0.1:4567/ajax", type: "GET", 
		success: function(data){
		var items = JSON.parse(data);
		for(var i=0;i<items.length;i++) {
			var li = document.createElement('li');
			var delete_button = document.createElement('button');
			var checkbox = document.createElement('input');
			var span = document.createElement('span');
			var quantity = document.createElement('input');
			$(delete_button).attr('class', 'delete');
			$(delete_button).attr('id', items[i].name);
			$(delete_button).text('X');
			$(checkbox).attr('type', 'checkbox');
			$(checkbox).attr('class', 'checkbox');
			$(checkbox).attr('id', items[i].name);
			$(quantity).attr('type', 'text');
			$(quantity).attr('class', 'quantity');
			$(quantity).css('width', '40');
			$(quantity).attr('placeholder', items[i].quantity)
			$(quantity).attr('id', items[i].name);
			$(span).text(items[i].name);
			$(li).attr('id', items[i].name);
			$(li).append(span);
			$(li).append(delete_button);
			$(li).append(checkbox);
			$(li).append(quantity);
			$('.groceries').append(li);
		};
		addItem();
		deleteItem();
		lineThrough();
	}});

});

////////////////////////////////////

// $(function(){	
// 	$.ajax({url: "http://127.0.0.1:4567/ajax", type: "GET", 
// 		success: function(data){

// 			var products = JSON.parse(data);

// 			for(var i=0;i<products.length;i++) {
// 				var li = document.createElement('li');
// 				var delete_button = document.createElement('button');
// 				$(delete_button).attr('class', 'delete');
// 				$(delete_button).attr('id', products[i].name);
// 				$(delete_button).text('Delete');
// 				$(li).text("Name: " + products[i].name);
// 				$(li).attr('id', products[i].name);
// 				$(li).append(delete_button);
// 				$('.groceries').append(li);
// 			};
				
// 			var input = document.createElement('input');

// 			$('.add').click(function(){
// 				console.log('addddd');
// 				var input = $('input').val();

// 				$.post("http://127.0.0.1:4567/add", {name: input}, function(){

// 					var li = document.createElement('li');
// 					var delete_button = document.createElement('button');
// 					$(delete_button).attr('class', 'delete');
// 					$(delete_button).attr('id', input);
// 					$(delete_button).text('Delete');
// 					$(li).text("Name: " + input);
// 					$(li).attr('id', input);
// 					$(li).append(delete_button);
// 					$('.groceries').append(li);

// 					input.value = "";

// 					$('.delete').click(function(){
// 						console.log("deleteee");
// 						var name = this.id;
// 						$.ajax({url: "http://127.0.0.1:4567/delete", type: 'DELETE', data: {name: name}});
// 						$(this).parent('li')[0].remove();
// 					});
// 				});

// 			});

// 			$('.delete').click(function(){
// 				console.log("deleteee");
// 				var name = this.id;
// 				$.ajax({url: "http://127.0.0.1:4567/delete", type: 'DELETE', data: {name: name}});
// 				$(this).parent('li')[0].remove();
// 			});
// 	}});
// });