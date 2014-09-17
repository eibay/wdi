window.onload = function(){
	var input = document.getElementById("input");
	var add = document.getElementById("add");
	var del = document.getElementById("delete");
	var list = document.getElementById("list");
	add.addEventListener("click", function(){
		var el = document.createElement("li");
		el.innerText = input.value;
		if (input.value != "") {
			list.appendChild(el);
		}
		input.value = "";
	})
	del.addEventListener("click", function() {
		var text = input.value;
		var all = document.querySelectorAll("li");
		for (i = 0; i < all.length; i++) {
			if (text == all[i].innerText) {
				list.removeChild(all[i])
			}
		}
		input.value = "";
	})
}