// 	var AppRouter = Backbone.Router.extend({
// 		routes: {
// 			'': 'main',
// 		}
// 	});

// 	var appRouter = new AppRouter;

$(function(){

	function createItem(item, quant) {
	
		$.post('/add', {item: item, quantity: quant}).done(function(res) {
			console.log(res)
			jsonRes = JSON.parse(res);
			var listItem = '<li id="'+jsonRes['id']+'">'+item+' <span id="'+jsonRes['id']+'">'+quant+'</span>'+ ' <i class="fa fa-caret-square-o-up up" id="'+jsonRes['id']+'"></i> <i class="fa fa-caret-square-o-down down" id="'+jsonRes['id']+'"></i> <i class="fa fa-trash delete-button" id="'+jsonRes['id']+'"></i></li>'
			$('.to-buy').append(listItem);

			deleteItem();
			upQuant();
			downQuant();
		});
	}

	function deleteItem() {
		deleteButtons = $('.delete-button')
		deleteButtons.on('click', function(event) {

			$.ajax({
				url: '/delete',
				data: {toDeleteId: event.target.id},
				// contentType: "application/json",
				type: "DELETE",
				success: function(result){
				}
			});
			event.target.parentNode.remove();
		});
	};
	deleteItem();

	function upQuant() {
		upButtons = $('.up')
		upButtons.on('click', function(event) {

			$.ajax({
				url: '/list_up',
				data: {id: event.target.id},
				type: 'PUT',
				success: function(result){
				}
			})
			.done(function(res) {
				console.log(res)
				event.target.parentNode.children[0].innerText = res
			})
			
			
		})
	}
	upQuant();

	function downQuant() {
		downButtons = $('.down')
		downButtons.on('click', function(event) {

			$.ajax({
				url: '/list_down',
				data: {id: event.target.id},
				type: 'PUT',
				success: function(result){
				}
			})
			.done(function(res) {
				console.log(res)
				event.target.parentNode.children[0].innerText = res
			})
			
			
		})
	}
	downQuant();



	$('#add-button').on('click', function() {
		createItem($('#item-name').val(), $('#item-quant').val());
	})

	$('.to-buy, .bought').sortable({connectWith: '.list'}).disableSelection();

	// $('.to-buy').on('sortupdate', function(){
	// 	$.ajax({
	// 		url: '/list_update',
	// 		data: {item: event.target}
	// 	})
	// })

	
	$('#eraser').droppable({
		drop: function(event, ui) {
			debugger
			var id = ui.helper.children(0)[0].id
			$.ajax({
				url: '/delete',
				data: {toDeleteId: id},
				type: "DELETE",
				success: function(result){
				}
			});
			ui.helper[0].remove()
		}
	});





});




