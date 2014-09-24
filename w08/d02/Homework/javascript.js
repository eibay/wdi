window.onload = function(){

	// for buy button that loads modal, assigning the t-shirt id when clicked
	var buy_buttons = document.getElementsByClassName("buy-button");

	for (var i = 0; i < buy_buttons.length; i++){
		buy_buttons[i].addEventListener("click", function(e){
			shirt_id = e.target.value
		})
	}
	////




};