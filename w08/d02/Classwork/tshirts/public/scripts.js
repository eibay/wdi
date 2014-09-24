var addShirt = document.getElementById('addshirt');

if(addShirt){
	addShirt.addEventListener('click', function(){
		var modal = document.getElementById('orderadded');
		modal.innerHTML = '';
		var formData = {};
		formData.shirtName = document.getElementById('name').value;
		formData.price = document.getElementById('price').value;
		formData.picture = document.getElementById('picture').value;
		formData.quantity = document.getElementById('quantity').value;
		var xhr = new XMLHttpRequest();
		xhr.open('POST','http://localhost:4567/addshirt', true);
		xhr.addEventListener('load', function() {

			modal.innerHTML = "<h1>Shirt Successfully added!</h1>";
		});
		xhr.send(JSON.stringify(formData));
	});
}

var addToCart = document.getElementsByClassName('addtocart');
var addToOrder = document.getElementsByClassName('addtoorder');
var select = document.getElementsByClassName('selectshirt');
var shirtId = document.getElementsByClassName('shirt_id');

for(var i = 0; i < addToCart.length; i++){

	addToCart[i].addEventListener('click', function(){
		
		var quantity = document.getElementById('select'+parseInt(event.target.value)).value
		var shirt_id = document.getElementById('shirtId'+parseInt(event.target.value)).value
		var formData = {};
		formData.quantity=quantity;
		formData.shirt_id=shirt_id
		var id = event.target.value
		
		var xhr = new XMLHttpRequest();
		xhr.open('POST','http://localhost:4567/addtocart', true);
		xhr.addEventListener('load', function() {
			var xhr2 = new XMLHttpRequest();
			xhr2.open('GET', 'http://localhost:4567/', true);
			xhr2.send();
			console.log(id);
			addToOrder[parseInt(id)].innerHTML = 'Item Successfully Added!';
			var button_back=function(){
				addToOrder[parseInt(id)].innerHTML = '';
			};
			setTimeout(button_back, 2500)
		});
		xhr.send(JSON.stringify(formData));
	});
}



var finalizeOrder=document.getElementById('finalizeorder');
if(finalizeOrder){
	finalizeOrder.addEventListener('click', function(){
		var data = {};
		var shirtsArray = [];
		var quantityArray = [];
		var shirts=document.getElementsByClassName('shirtInCart');
		var quantities=document.getElementsByClassName('shirtInCartQuant');
		for(var i = 0; i < shirts.length; i++){

			shirtsArray.push(shirts[i].value)
			quantityArray.push(quantities[i].value)

		}
		data.shirtsArray = shirtsArray;
		data.QuantityArray = quantityArray;
		var xhr = new XMLHttpRequest();
		xhr.open('POST','http://localhost:4567/submitcart', true);
		xhr.addEventListener('load', function(){
			var theCart=document.getElementsByClassName('theCart')[0];
			theCart.innerHTML = '<h1>Order Successfully Submitted!</h1>'
			var cartEmpty=function(){
				theCart.innerHTML = '<h1>Your Cart is Empty</h1>';
			};
			setTimeout(cartEmpty, 2500)



		});
		xhr.send(JSON.stringify(data));

	});
}

var fulfillOrder=document.getElementsByClassName('fulfillOrder');

for(var i = 0; i < fulfillOrder.length; i++){
	
	fulfillOrder[i].addEventListener('click', function(){
		var xhr = new XMLHttpRequest();
		var order = event.target.value;
		xhr.open('POST','http://localhost:4567/fulfillorder', true);
		xhr.addEventListener('load', function(){
			var span = document.getElementById(order);
			span.innerHTML = '<h5>Order Successfully Fulfilled</h5>';
		});

		xhr.send(JSON.stringify([order]))



	});
}

















