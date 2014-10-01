$(function(){	
	$.ajax({url: "http://127.0.0.1:4567/ajax", type: "GET", 
		success: function(data){

			var products = JSON.parse(data);

			for(var i=0;i<products.length;i++) {
				var li = document.createElement('li');
				var delete_button = document.createElement('button');
				$(delete_button).attr('class', 'delete');
				$(delete_button).attr('id', products[i].name);
				$(delete_button).text('Delete');
				$(li).text("Name: " + products[i].name);
				$(li).attr('id', products[i].name);
				$(li).append(delete_button);
				$('.groceries').append(li);
			};
				
			var input = document.createElement('input');

			$('.add').click(function(){
				console.log('addddd');
				var input = $('input').val();

				$.post("http://127.0.0.1:4567/add", {name: input});

				var li = document.createElement('li');
				var delete_button = document.createElement('button');
				$(delete_button).attr('class', 'delete');
				$(delete_button).attr('id', input);
				$(delete_button).text('Delete');
				$(li).text("Name: " + input);
				$(li).attr('id', input);
				$(li).append(delete_button);
				$('.groceries').append(li);

				// var products = JSON.parse(data);

				// for(var i=0;i<products.length;i++) {
				// 	var li = document.createElement('li');
				// 	var delete_button = document.createElement('button');
				// 	$(delete_button).attr('class', 'delete');
				// 	$(delete_button).attr('id', products[i].name);
				// 	$(delete_button).text('Delete');
				// 	$(li).text("Name: " + products[i].name);
				// 	$(li).attr('id', products[i].name);
				// 	$(li).append(delete_button);
				// 	$('.groceries').append(li);
				// };

				input.value = "";
			});

			$('.delete').click(function(){
				console.log("deleteee");
				var name = this.id;
				$.ajax({url: "http://127.0.0.1:4567/delete", type: 'DELETE', data: {name: name}});
				$(this).parent('li')[0].remove();
			});
	}});
};