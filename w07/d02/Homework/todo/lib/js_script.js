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
	listItem.addEventListener("keydown", becomeElAgain)
}

function makeCheckbox(div) {
	var box = document.createElement("input");
	box.type = "checkbox";
	box.addEventListener("click", function(feed) {
		div.firstChild.removeEventListener("click", becomeEditor);
		div.style.textDecoration = "line-through";
		left.innerText = parseInt(left.innerText) - 1;
		box.parentNode.removeChild(box.nextSibling);
		box.parentNode.removeChild(box.nextSibling);
		box.parentNode.removeChild(box);
		console.log(feed.target)
	})
	div.appendChild(box);
}

function becomeElAgain(feed) {
	textInput = feed.target;
	textInput.removeEventListener("input", becomeElAgain)
	text = textInput.value
	if (feed.keyIdentifier == "Enter") {
		el = textInput.parentNode;
		el.removeChild(textInput);
		el.innerText = text;
		el.addEventListener("click", becomeEditor)
	}
}

// function finishToDo(feed) {
// 	console.log(feed.target)
// 	listItem.removeEventListener("click", becomeEditor);
// 	listItem.removeEventListener("click", finishToDo);
// 	listItem.style.textDecoration = "line-through";
// 	left.innerText = parseInt(left.innerText) - 1;
// }

function createEl(feed) {
	var listItem = feed.target;
	if (feed.keyIdentifier == "Enter") {
		var el = document.createElement("li");
		el.innerText = listItem.value;
		el.addEventListener("click", becomeEditor);
		var div = document.createElement("div");
		div.appendChild(el);
		makeCheckbox(div);
		makePrioritizer(div);
		list.insertBefore(div, list.firstElementChild);
		listItem.value = "";
		left.innerText = parseInt(left.innerText) + 1;
	}
}


function makePrioritizer(div) {
	up = document.createElement("button");
	up.innerText = "Up";
	up.addEventListener("click", prioritizeUp)
	div.appendChild(up);	
	down = document.createElement("button");
	down.innerText = "Down";
	down.addEventListener("click", prioritizeDown);
	div.appendChild(down);
}

function prioritizeUp(feed) {
	div = feed.target.parentNode;
	if (div.previousSibling != div.parentNode.firstChild){
		previousItem = div.previousSibling;
		div.parentNode.insertBefore(div, previousItem);
	}
}

function prioritizeDown(feed) {
	div = feed.target.parentNode;
	if (div.nextSibling == div.parentNode.lastChild){
		div.parentNode.appendChild(div)
	}
	else if (div.nextSibling.nextSibling != null) {
		div.parentNode.insertBefore(div, div.nextSibling.nextSibling)
	}
}


}














