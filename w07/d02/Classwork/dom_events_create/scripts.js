window.onload = function(){

	var add_button = document.getElementById("add");
	var delete_button = document.getElementById("delete");

		// function addToList(){}

		// button.addEventListener("click", addToList);

		add_button.addEventListener("click", function(){
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
		
		delete_button.addEventListener("click", function(){
			var textbox = document.getElementById("user_input");
			var text = textbox.value;
			var list = document.getElementById("list");
			var listItems = list.children;

			for ( var l=0; l < listItems.length; l++ ) {
				
				if (text == listItems[l].innerText) {
					listItems[l].parentNode.removeChild(listItems[l]);					
				}				
			}	
			textbox.value = ("");		
		});
		
	};