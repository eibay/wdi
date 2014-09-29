var img = document.querySelectorAll("img").length
var purchase = document.getElementsByClassName("purchase")
for (i=0; i < img; i++) {
	purchase[i].addEventListener("click",function(){
	 createForm(this.id);
	});
}

function createForm (id) {

	var form = document.createElement("form");
	form.setAttribute('class', "col-md-6 col-md-offset-3")
	form.setAttribute('action', "/purchase/" + id)
	form.setAttribute('method', "post");
	var quant = document.createElement("input");
	quant.setAttribute('type', "text");
	quant.setAttribute('name', "quantity");
	quant.setAttribute('placeholder', "how many shirts?");
	quant.setAttribute('required', "required")
	var email = document.createElement("input");
	email.setAttribute('type',"text");
	email.setAttribute('name', "email");
	email.setAttribute('placeholder', "email address please");
	email.setAttribute('required', "required")
	var buyButton = document.createElement("button")
	buyButton.innerText="Buy it!"
	var formPlace = document.getElementById("formPlace")
	form.appendChild(email);
	form.appendChild(quant);
	form.appendChild(buyButton);
	console.log(form)
	var shirts = document.getElementById("shirts")
	shirts.parentNode.removeChild(shirts)
	
	document.getElementById("formPlace").appendChild(form);
}



