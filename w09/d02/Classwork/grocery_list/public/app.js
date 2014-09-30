$(function(){

	function lister(list){
		for (var i = 0; i < list.length; i++) {
			$('ul').append('<li><input type="checkbox">' + list[i]["item"] + ' <input class="quantity" type="text" value="1"> <button class="btn del" id="' + list[i]["id"] + '">X</button></li>');
			$('#' + list[i]["id"]).on('click', function(){
				$.ajax({url: 'http://127.0.0.1:4567/item', type: 'DELETE', data: {item: $(this).attr('id')}});
				$(this).parent().remove();
			})
		}

	}

	$.get('http://127.0.0.1:4567/list', function(items){
		lister(items);
	});

	$('button').on('click', function(){	
	var item = $('input').val()	
		$.post('http://127.0.0.1:4567/item', item, function(data){
			lister(data);
		});
		$('input').val('');
	});
	
})