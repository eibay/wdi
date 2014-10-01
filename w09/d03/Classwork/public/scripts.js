
// This is jquery onload function, you can only have 1 per page. it says do the stuff wrapped 
// inside it after page loads.
	$(function(){

		$( "button" ).on( "click", function(e) {
			e.preventDefault();
	  	var name = $("#name").val();
	  	var age = $("#age").val();
	  	console.log(name);
	  	console.log(age);
	  	var $ul = $("ul");
	  	$.ajax({
			url: "http://127.0.0.1:4567/create",
			type: "POST",
			data: {"name": name,
						"age": age}
			}).done(function(data) {
				console.log(data);
				$ul.append("<li>" + name + age + "</li>");
			})
		});
		getNames();
	});

	// e stands for event

	function getNames() {
		$.ajax({
			url: "http://127.0.0.1:4567/names",
			type: "GET"
		}).done(function(data) {
			console.log(data);
			var persons = JSON.parse(data);
			var $ul = $("ul");
			for (var i = 0; i < persons.length; i++) {
				$ul.append("<li>" + persons[i]["name"]+ persons[i]["age"] + "</li>");
			}
		})
	}

	





	
