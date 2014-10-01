$(function() {



	$("input.item-entry").keydown(createListItem)

	function createListItem(feed) {

		if (feed.keyCode == 13) {
			var item = feed.target.value
			feed.target.value = ""
			postItem(item)
		}
	}

	getList()


	function getList(feed) {
		$.ajax({
			method: "GET",
			url: "http://127.0.0.1:4567/list",
			success: populateList,
		})		
	}

	function populateList(feed) {
		JSON.parse(feed).forEach(function(item) {
			createListItemElement(item.name, item.id, item.quantity, item.checked)
		})
	}

	function postItem(name) {
		$.ajax({
			method: "POST",
			url: "http://127.0.0.1:4567/additem",
			data: {item: name, quantity: 1},
			success: makeNewItem,
		})
	}

	function makeNewItem(feed) {
		var item = JSON.parse(feed)
		createListItemElement(item.name, item.id, item.quantity, item.checked)
	}

	function deleteEventThing(feed) {
		$.ajax({
			type: "DELETE",
			url: "http://127.0.0.1:4567/item",
			data: {id: feed.target.id},
			success: function(){feed.target.parentNode.parentNode.removeChild(feed.target.parentNode)},
		})
	}

	function createListItemElement(name, id, quant, checked) {
		item_string = "<li id='" + id + "'>" + name + "    <input class='quantity' id='" + id + "'>"
		item_string += "<input class='purchased' id='" + id + "' type='checkbox'>"
		item_string += "<button class='delete' id='" + id + "''>X</button></div>"
		$("ul.list").append(item_string)
		$("#" + id + ".delete").click(deleteEventThing)
		var strikeOut = $("#" + id + ".purchased")
		var quantity = $("#" + id + ".quantity")
		quantity.val(quant)
		quantity.keydown(changeQuantity)
		if (checked) {
			strikeOut[0].checked = checked
			$("li#" + id)[0].style.textDecoration = "line-through"
		}
		strikeOut.click(changeCheckBox)
	}

	function changeQuantity(feed) {
		if (feed.keyCode == 13) {
			var quantity = feed.target.value
			var id = feed.target.id
			console.log(feed)
			$.ajax({
				type: "PUT",
				url: "http://127.0.0.1:4567/quantity",
				data: {quantity: quantity, id: id},
			})
		}
	}

	function changeCheckBox(feed) {
		var id = feed.target.id
		var checked = feed.target.checked
		$.ajax({
			type: "PUT",
			url: "http://127.0.0.1:4567/checkbox",
			data: {id: id, checked: checked},
			success: checkBoxAdjustments(feed)
		})
	}

	function checkBoxAdjustments (feed) {
		var id = feed.target.id
		if (feed.target.checked == true) {
			$("li#" + id)[0].style.textDecoration = "line-through"
		}
		else {$("li#" + id)[0].style.textDecoration = ""}
	}

})