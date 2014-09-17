window.onload = function(){
	
	var ul = document.getElementById("todo_list");
	var textbox= document.querySelector("input");
	var addButton = document.querySelector("button");

	addButton.addEventListener("click", function(){
		var text = textbox.value;
		var listItem = document.createElement("li");
		var inputCheckBox = document.createElement("input");
		inputCheckBox.type = "checkbox";
		var upDown = document.createElement("div");
		upDown
		listItem.innerText = text;
		listItem.insertBefore(inputCheckBox, listItem.innerText);	

		ul.appendChild(listItem);
		
		textbox.value = "";
	});


	ul.addEventListener("click", function(){
		for(var i =0; i< ul.children.length; i++){
			if(ul.children[i].children[0].checked == true){
				var childNode = ul.children[i];
				setTimeout(function(){
					childNode.parentNode.removeChild(childNode)
				}, 1500);
			};
		};
	});

};