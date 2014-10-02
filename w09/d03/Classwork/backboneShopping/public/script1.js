$(function() {

	// getList()

	var AppRouter = Backbone.Router.extend({
		routes: {
			"": "list",
		}
	})

	var router = new AppRouter


	var ItemView = Backbone.View.extend({

		events: {
			"click button.delete" : "deleteEventThing",
			"keydown input.quantity" : "changeQuantity",
			"click input.purchased" : "changeCheckBox",
		},

		deleteEventThing : function(feed){
			$.ajax({
			type: "DELETE",
			url: "http://127.0.0.1:4567/item",
			data: {id: feed.target.parentNode.id},
			success: function(){feed.target.parentNode.parentNode.removeChild(feed.target.parentNode)},
			})
		},

		changeQuantity : function(feed) {
			if (feed.keyCode == 13) {
			var quantity = feed.target.value
			var id = feed.target.parentNode.id
			$.ajax({
				type: "PUT",
				url: "http://127.0.0.1:4567/quantity",
				data: {quantity: quantity, id: id},
				})
			$("input.item-entry").focus()
			}
		},

		changeCheckBox : function(feed) {
			var id = feed.target.parentNode.id
			var checked = feed.target.checked
			$.ajax({
				type: "PUT",
				url: "http://127.0.0.1:4567/checkbox",
				data: {id: id, checked: checked},
				success: checkBoxAdjustments(feed)
			})
		},

		tagName: "li",

		// initialize: function(anObj) {
		// 	this.quantity = anObj.quantity
		// 	this.checked = anObj.checked
		// 	this.name = anObj.name
		// },

		initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy", this.remove);
		},

		render: function() {
			item_string = "     <input class='quantity'>"
			item_string += "<input class='purchased' type='checkbox'>"
			item_string += "<button class='delete'>X</button></div>"
			this.$el.html(this.name + item_string)
			this.$el.find(".quantity").val(this.quantity)
		}

	})


	router.on("route:list", function() {
		console.log("hit the route")
		var itemView = new itemView
	})

	$("input.item-entry").keydown(createListItem)

	function createListItem(feed) {

		if (feed.keyCode == 13) {
			var item = feed.target.value
			feed.target.value = ""
			postItem(item)
		}
	}


	var ItemModel = Backbone.Model.extend({
		urlRoot: "/items",
	})

	var ItemCollection  = Backbone.Model.extend({
		url: "/items",
		model: "ItemModel",
	})


	// function getList(feed) {
	// 	$.ajax({
	// 		method: "GET",
	// 		url: "http://127.0.0.1:4567/list",
	// 		success: populateList,
	// 	})		
	// }

	// function populateList(feed) {
	// 	JSON.parse(feed).forEach(function(item) {
	// 		createListItemElement(item)
	// 	})
	// }

	var collection = new ItemCollection()

	collection.fetch({
		success: function() {
			console.log(arguments)
			arguments[1].forEach(function(item) {
				var view = new ItemView({model: item})

				view.render()

				$("ul").append(view.el)
			})
		}
	})



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
		createListItemElement(item)
		$("ul").find(".quantity").last().focus()
	}

	// function deleteEventThing(feed) {
	// 	$.ajax({
	// 		type: "DELETE",
	// 		url: "http://127.0.0.1:4567/item",
	// 		data: {id: feed.target.parentNode.id},
	// 		success: function(){feed.target.parentNode.parentNode.removeChild(feed.target.parentNode)},
	// 	})
	// }

	function createListItemElement(item) {
		var view = new ItemView(item)
		view.render()
		$("ul.list").append(view.$el)
		// $("li#" + item.id + " button").click(deleteEventThing)
		var strikeOut = $("li#" + item.id + " input.purchased")
		// var quantity = $("li#" + item.id + " input.quantity")
		// quantity.val(item.quantity)
		// quantity.keydown(changeQuantity)
		if (item.checked) {
			strikeOut[0].checked = item.checked
			$("li#" + item.id)[0].style.textDecoration = "line-through"
		}
		// strikeOut.click(changeCheckBox)
	}

	// function changeQuantity(feed) {
	// 	if (feed.keyCode == 13) {
	// 		var quantity = feed.target.value
	// 		var id = feed.target.parentNode.id
	// 		$.ajax({
	// 			type: "PUT",
	// 			url: "http://127.0.0.1:4567/quantity",
	// 			data: {quantity: quantity, id: id},
	// 		})
	// 		$("input.item-entry").focus()
	// 	}
	// }

	// function changeCheckBox(feed) {
	// 	var id = feed.target.parentNode.id
	// 	var checked = feed.target.checked
	// 	$.ajax({
	// 		type: "PUT",
	// 		url: "http://127.0.0.1:4567/checkbox",
	// 		data: {id: id, checked: checked},
	// 		success: checkBoxAdjustments(feed)
	// 	})
	// }

	function checkBoxAdjustments (feed) {
		var id = feed.target.parentNode.id
		if (feed.target.checked == true) {
			$("li#" + id)[0].style.textDecoration = "line-through"
		}
		else {$("li#" + id)[0].style.textDecoration = ""}
	}

})