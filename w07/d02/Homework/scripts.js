
addButton.addEventListener("click", function(){
	var text = textbox.value;

	var listItem = document.createElement("li");
	listItem.innerText = text;
	ul.appendchild(listItem);
	text = '';
});
