window.onload = function(){

var orderNowButton = document.getElementById("orderNow")

var quantity = document.getElementById("quantity")

var email = document.getElementById("email")

var tshirt_id = document.querySelector("title").innerText

var url = "http://localhost:4567/tshirts/" + tshirt_id

var order_details = {}

order_details["email"] = email
order_details["quantity"] = quantity
order_details["tshirt_id"] = tshirt_id

order_details = JSON.stringify(order_details)


orderNowButton.addEventListener("click", function() {
	console.log("ASDSDA")
var xhr = new XMLHttpRequest();
		xhr.open('POST', url, true)

		xhr.setRequestHeader("Content-type", "application/json");

		xhr.send(order_details)
	});
}