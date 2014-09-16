window.onload = function(){

	var button = document.querySelector("button");

		// function addToList(){}

		// button.addEventListener("click", addToList);

		button.addEventListener("click", function(){
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
		
	};