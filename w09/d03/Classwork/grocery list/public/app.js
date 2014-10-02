function del(item){
	$.ajax({
		type: "DELETE",
		url: "/delete",
		data: {"item":item.id},
		success: function(something){
			console.log(something)
		}
	})
}

$(document).ready(function(){
	
	var button = $("#add").on("click", function(){
		var item = $("input").val();
			$.ajax({
			type: "POST",
			url: "/add_item",
			data: {"list":item},
			success: function(something){
				var newId = something.id

				$("#list").append("<li>" + item + "<button class='delete' id="+ newId+">Delete</button></li>")
				$("#"+item).on("click", function(){
					del(this);
					console.log("you've reached the delete route")
					$(this).parent().remove()
				});
			},
		})

	});

	$(".delete").on("click", function(){
		del(this);
		$(this).parent().remove();
	})
})