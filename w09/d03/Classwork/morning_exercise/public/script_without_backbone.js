

$(function(){
	function putRequest(name, age, id) {
		$.ajax({
		type: "PUT",
		url: "/edit",
		data: {"name": name, "age": age, "id": id}
		}).done(function(response){
			console.log("Put request sent.")
				var $ul = $("ul")
				var response = JSON.parse(response)
				$ul.append("<li>" + response["name"] + " - " + response["age"] + "<button class='edit' id='"+ response["id"]+ "'>Edit</button></li>");
		})
	}


	function postRequest(name, age) {
		$.ajax({
		type: "POST",
		url: "/create",
		data: {"name": name, "age": age}
		}).done(function(response){
			console.log("Post request sent.")
				var $ul = $("ul")
				var response = JSON.parse(response)
				$ul.append("<li id='"+ response["id"]+ "'>" + response["name"] + " - " + response["age"] + "<button class='edit' >Edit</button></li>");
			addEditListeners()
		})
	}

	$.ajax({
		type: "GET",
		url: "/view_all",
		}).done(function(data){
		var $ul = $("ul");
		var data = JSON.parse(data)
		for	(var i = 0; i < data.length; i++) {
			$ul.append("<li id='"+ data[i]["id"]+ "'>" + data[i]["name"] + " - " + data[i]["age"] + "<button class='edit'>Edit</button></li>");
		}
			addEditListeners()
		})


	function addEditListeners() {
		var $editButton = $("button.edit");
		$editButton.on("click", function(){
			$(this).parent().append("<input id='newName' placeholder='New Name' </input><input id='newAge' placeholder='New Age' </input><button class='saveChanges'>Save Changes</button>");
			addSaveChangesListener();
		});
	};
	
	function addSaveChangesListener(){
		var $saveChangesButton = $("button.saveChanges");
		$saveChangesButton.on("click", function(){
			var id = $(this).parent().attr("id")
			var $newNameInput = $("input#newName")
			var $newAgeInput = $("input#newAge")
			var newName = $newNameInput.val();
			var newAge = $newAgeInput.val();
			putRequest(newName, newAge, id)
		});
	};	

	var $button = $("button#add")

	$button.on("click", function(event){
		event.preventDefault();
		console.log("button has been clicked");
		var $ageInput = $("input#age");
		var $nameInput = $("input#name");
		var name = $nameInput.val();
		var age = $ageInput.val();
		console.log(age);
		console.log(name);
		postRequest(name, age);
		$('.form-inline').trigger("reset");
	});


});

