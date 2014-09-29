window.onload = function(){

	var buttonAdd = document.getElementById("add");
	var buttonSub = document.getElementById("sub");
		// function addToList(){}

		// button.addEventListener("click", addToList);

		buttonAdd.addEventListener("click", function(){
			var textbox = document.getElementById("user_input");
			var text = textbox.value;
			if(text != ""){
				var listItem = document.createElement("li");
				listItem.innerText = text;

				var list = document.getElementById("list");
				list.appendChild(listItem);

				textbox.value = ""
			}
		});
		buttonSub.addEventListener("click", function(){
			var textbox = document.getElementById("user_input");
			var text = textbox.value;
			if (text != ""){
				var listItem = document.getElementsByTagName("li").textContent = text
				listItem.parentNode.removeChild(listItem)
			}

		});
	};