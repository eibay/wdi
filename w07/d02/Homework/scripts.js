window.onload = function(){

		var submitItem = document.getElementById("submit");
		submitItem.addEventListener("keypress", function(event) {
			if (event.keyIdentifier == "Enter"){
		var textbox = document.getElementById("submit");
		var text = textbox.value;
		// var aside = document.createElement("aside");
			if(text != ""){
				var listItem = document.createElement("li");
				// listItem.innerText = text;
				listItem.innerHTML = "<input type='checkbox' id='deselect' value="+text+">" + text;

				var list = document.getElementById("items");
				
				if (list.children.length == 0){
				list.appendChild(listItem);
				}
				else {
					var addBefore = list.children[0];
					list.insertBefore(listItem, addBefore);
				}
				
				textbox.value = "";
			}
		}
	});


		var deleteItem = document.getElementById("items");

		deleteItem.addEventListener("click", function(event) {
		var checkbox = document.getElementById("deselect");
		var item = checkbox.value;

		var list = document.getElementById("items");
		var listItems = list.children;

		for(var i = 0; i < listItems.length; i++){
			if (listItems[i].children[0].checked == true){
				listItems[i].parentNode.removeChild(listItems[i]);
				};
				}
				checkbox.value = "";

			});
};

// function makeBuddies(buddies) {
// 		var midEarth = document.getElementById("middle-earth");
// 		var aside = document.createElement("aside");
// 		var newUl = document.createElement("ul");

// 		buddies.forEach(function(buddy) {
// 		var newLi = document.createElement("li");
// 		newLi.innerText = buddy;
// 		newUl.appendChild(newLi);
// 		});
// 		aside.appendChild(newUl);
// 		var placement = midEarth.children[1];
// 		var insertedElement = midEarth.insertBefore(aside, placement);

// }

