


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

function getContent() {
	var input = document.querySelector("input#content");
	var content = input.value;
	input.value = ''
	return content 
}

function markItemDone(item) {
	item.style.textDecoration = "underline";
}

window.onload = function() {
	var button = document.querySelector("button"); 
	button.onclick = function() {
		createTodoListItem(getContent()); 
	}
}
