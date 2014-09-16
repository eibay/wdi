


function createTodoListItem(content) {
	var li = document.createElement("li");

	var para = document.createElement("p");
	para.innerText = content; 
	li.appendChild(para);

	var checkbox = document.createElement("input");
	checkbox.setAttribute("type", "checkbox"); 
	li.appendChild(checkbox); 

	var todoList = document.querySelector("ul");
	todoList.appendChild(li); 
}

window.onload = function() {
	
}