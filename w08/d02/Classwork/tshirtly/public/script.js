var shirts = document.querySelectorAll(".shirt_window")

function orderShirts(feed) {
	var item = feed.target.parentNode.attributes.name.value;
	var row = document.createElement("div");
	row.class = "row"
	row.id = item
	var quant = document.createElement("input");
	row.innerText = item;
	quant.value = "1";
	row.appendChild(quant);
	var email = document.createElement("input");
	email.placeholder = "your@email.address";
	email.name = feed.target.id;
	row.appendChild(email)
	var button = document.createElement("button")
	button.addEventListener("click", postToServer)
	button.innerText = "Order!"
	row.appendChild(button)
	row.style.marginLeft = "30%";
	row.style.marginBottom = "20px"
	var entry = document.querySelectorAll(".row")[1];
	entry.parentNode.insertBefore(row, entry);
}

function postToServer(feed) {
	var shirt = feed.target.previousSibling.name;
	var email = feed.target.previousSibling.value;
	var quantity = feed.target.previousSibling.previousSibling.value;
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/order', true);
	xhr.setRequestHeader("Content-type", "application/json");
	var params = {email: email, quantity: quantity, shirt: shirt, closed: false};
	params = JSON.stringify(params);
	xhr.send(params);
	feed.target.parentNode.parentNode.removeChild(feed.target.parentNode)

}


for (i = 0; i < shirts.length; i++) {
	shirts[i].addEventListener("click", orderShirts)
}

