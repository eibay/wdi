$(function(){

	var ul=$('ul')


	function loadItems(){
		ul.html("")
	
		$.getJSON('/all', function(data){
			
			$.each(data, function(key, value){
					
				if(value.bought == false){
					ul.append("<li id='"+value.id+"'>"+value.item+", "+value.quantity+"</li><button class='remove' id='"+value.id+"'>Remove</button></input><input class='quantity' placeholder='quantity' id='"+value.id+"'></input><input type='checkbox' class='bought' id='"+value.id+"'></input>")
				}else{
					ul.append("<li id='"+value.id+"'><strike>"+value.item+"</strike></li><button class='remove' id='"+value.id+"'>Remove</button><input type='checkbox' class='bought' id='"+value.id+"'></input>")
				};

			})

			addFunctions()

		})
		
	};


	function addFunctions(){
			$('button.remove').on('click', function(){
				var itemID = this.id
				$.post('/remove/'+itemID, function(){
					loadItems()
				})
			})

			$('input.bought').on('click', function(){
				var itemID = this.id
				$.post('/bought/'+itemID, function(){
					loadItems()
				})
			})

			$('input.quantity').on('keydown', function(e){
				var itemID = this.id
				if (e.keyCode==13){
					var quantity = $('input#'+itemID+'.quantity').val()
					$.post('quantity/'+itemID+"/"+quantity, function(){
						loadItems()
					})
					
					$('input#'+itemID+'.quantity').val('')
				}
			})
	};


	$('button.add').on('click', function(){
		
		var item = $('input.item').val()
		
		$.post('/add/'+item, function(){
			loadItems()
			$('input').val('')
		})
		
	});

	$('input').on('keydown', function(e){
		if(e.keyCode ==13){
			var item = $('input.item').val()

			$.post('/add/'+item, function(){
				loadItems()
				$('input').val('')
			})
		}
	})


	loadItems()

});