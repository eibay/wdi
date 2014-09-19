var button = document.querySelector("button")

var button = document.querySelector("button")
button.addEventListener("click", function(){
	var locale = document.querySelector("input").value
	var xhr = new XMLHttpRequest

	xhr.open('GET', 'http://127.0.0.1:4567/api/' + locale);
	xhr.send();
	
	xhr.addEventListener("load", function(){


	var res = xhr.response
	res = JSON.parse(res)

	console.log(res)
for (i=0; i<res.length; i++) {
	var li = document.createElement("li")
	
	var img = "<img src='" + res[i] + "''>" 
	li.innerHTML = img;
	var ul = document.querySelector("ul")
	ul.appendChild(li) }
	});
});
