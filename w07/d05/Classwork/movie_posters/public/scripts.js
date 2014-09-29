var button = document.querySelector("button")
button.addEventListener("click", function(){
	var movie = document.querySelector("input").value
	var xhr = new XMLHttpRequest
	xhr.open('GET', '/api/' + movie);
	xhr.send();
	xhr.addEventListener("load", function(){
		var res = xhr.response

		var li = document.createElement("li")
		var img = "<img src='" + res + "'>"

		li.innerHTML = img;
		var ul = document.querySelector("ul")
		ul.appendChild(li)
	});
});