$(window).load(loadItems())

var input = $("input")[0];
var button = $("#addIt")[0];
var ul = $("ul")[0];

button.addEventListener("click", function(){
	console.log("#addIt clicked");
	createItem(input.value)
	input.value = ""
});


function addItem(item, id) {
	var li = document.createElement("li")
	li.setAttribute("class", id)
	var libutton = document.createElement("button")
	libutton.setAttribute("class", id)
	libutton.innerText = "woah nelly"
	libutton.addEventListener("click", removeItem)
	var box = document.createElement("input")
	box.setAttribute("type", "checkbox")
	box.setAttribute("class", id)
	box.addEventListener("click", strikethrough)
	li.innerText = item
	ul.appendChild(li);
	$(li).after(libutton)
	$(libutton).after(box)
};

function strikethrough() {
	console.log("strike")
}

function createItem(item) {
	$.ajax({
		type: "POST",
		url: "http://127.0.0.1:4567/newItem",
		data: {name: item},
		success: function(data) {
			list = data
				addItem(list["name"], list["id"])
			}
		});
}

function loadItems() {
	$.ajax({
		method: "GET",
		url: "http://127.0.0.1:4567/getItem",
		success: function(data) {
			list = JSON.parse(data)
			for(i=0; i<list.length; i++){
				addItem(list[i]["name"], list[i]["id"])}
			}
		});
}

function removeItem() {
	var thisclass = $(this).attr("class")

	$.ajax({
		method: "DELETE",
		url: "http://127.0.0.1:4567/" + thisclass,
		success: 
			removeList(thisclass) 
		
	})
}

function removeList(thisclass) {
$("li").remove("." + thisclass)
}
