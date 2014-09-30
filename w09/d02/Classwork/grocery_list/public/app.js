$(function(){

	function lister(list){
		for (var i = 0; i < list.length; i++) {
			$('ul').append('<li>' + list[i]["item"] + '<button id="' + list[i]["id"] + '">X</button></li>');
			$('#' + list[i]["id"]).on('click', function(){
				var string = $(this).parent().text();
				var item = string.substring(0, string.length - 1);
				$.ajax({url: 'http://127.0.0.1:4567/item', type: 'DELETE', data: {item: item}});
				$(this).parent().remove();
			})
		}

	}

	$.get('http://127.0.0.1:4567/list', function(items){
		lister(items);
		// for (var i = 0; i < items.length; i++) {
		// 	$('ul').append('<li>' + items[i]["item"] + '<button class="delete ' + items[i]["item"] + '">X</button></li>');
		// 	$('button.delete.' + items[i]["item"]).on('click', function(){
		// 		var string = $(this).parent().text();
		// 		var item = string.substring(0, string.length - 1);
		// 		$.ajax({url: 'http://127.0.0.1:4567/item', type: 'DELETE', data: {item: item}});
		// 		$(this).parent().remove();
		// 	})
		// }
	});

	$('button').on('click', function(){	
	var item = $('input').val()	
		$.post('http://127.0.0.1:4567/item', item).done(function(data){
			lister(data);
			// $('ul').append('<li>' + data["item"] + '<button id="' + data["id"] + '">X</button></li>');
			// $('#' + data["id"]).on('click', function(){
			// 	var string = $(this).parent().text();
			// 	var item = string.substring(0, string.length - 1);
			// 	$.ajax({url: 'http://127.0.0.1:4567/item', type: 'DELETE', data: {item: item}});
			// 	$(this).parent().remove();
			// });
		});
		$('input').val('');
	});
	
})