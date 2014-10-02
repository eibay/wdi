$(function(){
	$.get('/groceries').done(function(response){
		
		_.each(response.need, function(item){
			$('.list').append('<li id="'+item.id+'">'+item.item+'</li>')
			$('#'+item.id).append('<span class="quantity">'+item.quantity+'</span><span class="addquantity"><i class="fa fa-arrow-up"></i></span><span class="removequantity"><i class="fa fa-arrow-down"></i></span>')

		})
		$('.addquantity').on('click', function(){
			addQuantity($(this))

		})
		$('.removequantity').on('click', function(){
			removeQuantity($(this))


		})
		_.each(response.have, function(item){
			$('.list2').append('<li id="'+item.id+'">'+item.item+'</li>')
		})

	})
	$('#addIt').on('click', function(){

		var item=$('#additem').val();
		var quantity=$('#quantity').val();

		$.post('/add', {item:item, quantity:quantity}).done(function(response){

			$('.list').append('<li id="'+response.id+'">'+item+'</li>')
			$('#'+response.id).append('<span class="quantity">'+quantity+'</span><span class="addquantity"><i class="fa fa-arrow-up"></i></span><span class="removequantity"><i class="fa fa-arrow-down"></i></span>')
			$('.addquantity').on('click', function(){
				addQuantity($(this))
			})
			$('.removequantity').on('click', function(){
				removeQuantity($(this))

			})
			$('#additem').val(' ');
		})

	})


	$('.list, .list2').sortable({connectWith:'.lists'}).disableSelection();
	$('.list, .list2').on('sortupdate',function(event, ui) {
		var need = $('.list').children()
		var have = $('.list2').children()
		
		// ui.item.effect("bounce", 500)
		var which=event.target.className.split(' ')[0]

		if(which=="list"){
			_.each(need, function(child, index){
				console.log((child.children[0] != undefined))
				if((child.children[0] != undefined) != false){
					quantity=parseInt(child.children[0].innerText)
					console.log(quantity)
				}
				else{
					quantity=1
					console.log('hello')
					$('#'+child.id).append('<span class="quantity">1</span><span class="addquantity"><i class="fa fa-arrow-up"></i></span><span class="removequantity"><i class="fa fa-arrow-down"></i></span>')
					$('.addquantity').on('click', function(){
						addQuantity($(this))

					})
					$('.removequantity').on('click', function(){
						removeQuantity($(this))


					})
				}


				$.ajax({
					type: "PUT",
					url: "/updateposition",
					data:{id:child.id, position: index, bought:false, quantity:quantity}
				});

			})
		}
		else if(which=="list2"){

			ui.item.children().remove()

			_.each(have, function(child, index){
				console.log(child)
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
function addQuantity(item){
	var quantity=item.prev().text()
	var id=item.parent()[0].id
	$.ajax({
		type: "PUT",
		url: "/updatequantity",
		data:{id:id, quantity:quantity}
	});
	item.prev().text(parseInt(quantity)+1)
}
function removeQuantity(item){
	var quantity=item.prev().prev().text()
	var id=item.parent()[0].id
	$.ajax({
		type: "PUT",
		url: "/lowerquantity",
		data:{id:id, quantity:quantity}
	});
	item.prev().prev().text(parseInt(quantity)-1)


}
})

