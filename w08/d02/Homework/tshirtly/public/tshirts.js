window.onload = function() {  

function availableStock() {
	var productQuantity = document.querySelector('span.remaining').innerText;
	var orderQuantity = document.querySelector('span.ordered').innerText;
	if (orderQuantity > productQuantity) {
		return "Sorry! We only have" +productQuantity+ "left. Please adjust your order accordingly."
		} else {
		return (productQuantity - orderQuantity)
		}
	}

function lowSupplies(product) {
	var soldOut = []
	var runningLow = []
	var productQuantity = document.querySelector('span.remaining').innerText;
	if (productQuantity < 3) {
		runningLow.push(product)
	} else if (productQuantity == 0) {
		soldOut.push(product)
	}
}

};