$(function(){

	function lister(list){
		for (var i = 0; i < list.length; i++) {
			$('ul').append('<li class="item"><input id="' + list[i]["id"] + '" type="checkbox">' + list[i]["item"] + ' <input class="quantity" id="' + list[i]["id"] + 'type="text" value="1"> <button class="btn del"' + '">X</button></li>');
			if (list[i]["checked"] == true) {
				$('input#' + list[i]["id"]).prop('checked', true);
				$('input#' + list[i]["id"]).parent().css('textDecoration', 'line-through');	
			}
			$('input#' + list[i]["id"]).val(list[i]["quantity"]);
			$('input#' + list[i]["id"]).click(function(){
				saveState($(this).attr('id'), 'checked', $(this).prop('checked'));
				var that = this;
				$(this).parent().css('textDecoration', function() {
					return that.checked ? 'line-through' : "";
				})
			})
			$('.quantity').keypress(function(event){
				if (event.which == 13) {
					saveState($(this).attr('id'), 'quantity', $(this).val());
				}
			})	
			$('.del').on('click', function(){
				$.ajax({url: 'http://127.0.0.1:4567/item', type: 'DELETE', data: {item: $(this).attr('id')}});
				$(this).parent().remove();
			})
		}
	}

	function saveState(item, value, state){
		$.ajax({url: '/item', type: 'PUT', data: {item: item, value: value, state: state}})
	}

	$.get('http://127.0.0.1:4567/list', function(items){
		lister(items);
	});

	$('button').on('click', function(){	
		var item = $('input').val()	
		$.post('http://127.0.0.1:4567/item', item, function(data){
			lister(data);
		});
		$('input.add').val('');
	});
})