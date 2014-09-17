window.onload = function(){

var list = document.querySelector("#list");
var input = document.querySelector("#input");
var left = document.querySelector("#left");



input.addEventListener("keydown", createEl);

function giveEvent(feed) {
	console.log(feed)
}

function becomeEditor(feed) {
	var listItem = feed.target;
	var editor = document.createElement("input");
	editor.value = listItem.innerText;
	listItem.innerText = ""
	listItem.appendChild(editor);
	listItem.removeEventListener("click", becomeEditor)
	listItem.addEventListener("input", becomeElAgain)
}

function makeCheckbox(listItem) {
	var box = document.createElement("input");
	box.type = "checkbox";
	box.addEventListener("click", function() {
		listItem.removeEventListener("click", becomeEditor);
		listItem.style.textDecoration = "line-through";
		left.innerText = parseInt(left.innerText) - 1;
		box.parentNode.removeChild(box)
	})
	listItem.appendChild(box);
}

function becomeElAgain(feed) {
	textInput = feed.target;
	textInput.removeEventListener("input", becomeElAgain)
	text = textInput.value
	if (feed.keyIdentifier == "Enter") {
		el = textInput.parentNode;
		el.removeChild(textInput);
		el.innerText = text;
		makeCheckbox(el);
		el.addEventListener("click", becomeEditor)
	}
}

function finishToDo(feed) {
	listItem.removeEventListener("click", becomeEditor);
	listItem.removeEventListener("click", finishToDo);
	listItem.style.textDecoration = "line-through";
	left.innerText = parseInt(left.innerText) - 1;
}

function createEl(feed) {
	var listItem = feed.target;
	if (feed.keyIdentifier == "Enter") {
		var el = document.createElement("li");
		el.innerText = listItem.value;
		el.addEventListener("click", becomeEditor);
		makeCheckbox(el);
		makePrioritizer(el);
		list.insertBefore(el, list.firstElementChild);
		listItem.value = "";
		left.innerText = parseInt(left.innerText) + 1;
	}
}


function makePrioritizer(listItem) {
	up = document.createElement("button");
	up.innerText = "Up";
	up.addEventListener("click", prioritizeUp)
	listItem.appendChild(up);	
}

function prioritizeUp(feed){
	listItem = feed.target.parentNode;
	previousItem = listItem.previousSibling;
	listItem.parentNode.insertBefore(listItem, previousItem);
}














}