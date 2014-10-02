$(function(){

// 3rd
		$.ajax({
			url:"/people",
			type:"GET"
			}).done(function(data){
				// console.log(data);

// 4th
			var people = JSON.parse(data);
			console.log(data);
			var ul = $('ul');
				for(i = 0; i < people.length; i++){
				ul.append("<li id='"+ people[i]["id"]+ "'>" + 'Name: '+ people[i]["name"] + " <br> " + 'Age: ' +people[i]["age"] + '<br>' + "<button class='edit'>Edit</button></li>");
			}
				editButtonListener();
		});

	function editButtonListener() {
			var $editButton = $("button.edit");
			$editButton.on("click", function(){
				console.log("edit button has been clicked")
				$(this).parent().append("<input id='newName' placeholder='New Name' </input><input id='newAge' placeholder='New Age' </input><button class='save'>Save</button>");
				saveButtonListener();
			});
	};

	function saveButtonListener(){
			var $saveButton = $("button.save");
			$saveButton.on("click", function(){
				console.log("save button has been clicked");
			
			var id = $(this).parent().attr("id");
			
			var $newNameInput = $("input#newName");
			var $newAgeInput = $("input#newAge");
			
			var newName = $newNameInput.val();
			var newAge = $newAgeInput.val();

			putRequest(newName, newAge, id)
			
			});
	};

	function putRequest(name, age, id){
				$.ajax({
				type: "PUT",
				url: "/people_edit",
				data: {"name": name, "age": age, "id": id}
				}).done(function(response){
					console.log("Put request sent.")
					var response = JSON.parse(response);
		});
	}

// 2nd
			var button = $('button#submit');
				button.on("click", function(event) {
				event.preventDefault(); // able to click and console log using form
				// console.log(event);
					console.log("button click");

			
			var name = $('#name').val();
			var age = $('#age').val();
				console.log(name + " is " + age);


// function postRequest(name, age){
// 		$.ajax({
// 		url:"/create",
// 		type:"POST",
// 		data:{"name":name, "age":age}
// 		}).done(function(data){
// 			console.log("post request");
// 			var $ul = $("ul");
// 			var response = JSON.parse(response);
// 			$ul.append("<li>" + response["name"] + " - " + response["age"] + "<button class='edit' id='"+ response["id"]+ "'>Edit</button></li>");
// 	})
// };


			$.ajax ({
				url:"/create",
				type:"POST",
				data:{name: name, age: age}
				}).done(function(data){
					console.log(data);
				})
		})

	console.log("testing js")

});
