$(function(){

console.log("Connection made");

$.ajax({
		url:'/people',
		type: 'GET'
	}).done(function(data){
		var people = JSON.parse(data);
		console.log(data);
		var ul = $('ul');
		for (i=0; i<people.length; i++) {
			ul.append("<li id='"+ people[i]["id"]+ "'>" + "Name: " + people[i]["name"] + " " + "Age: " + people[i]["age"] + "</br><button class='delete'>Delete</button><button class='edit'>Edit</button></li>");
		}
			addEventListeners()
			deleteButtonListener();
	});

function addEventListeners() {
	var $editButton = $('button.edit');
	$editButton.on("click", function(){
		$(this).parent().append("<input id='newName' placeholder='Update name' </input><input id='newAge' placeholder='Update age' </input><button class='save'>Save Changes</button>");
			console.log("check check")
			saveChangesListener();	
	});
};

function saveChangesListener() {
	var saveChanges = $('button.save');
		saveChanges.on("click", function() {
			var id = $(this).parent().attr("id");
			
			var $newNameInput = $("input#newName");
			var $newAgeInput = $("input#newAge");
			
			var newName = $newNameInput.val();
			var newAge = $newAgeInput.val();

			putRequest(newName, newAge, id);

	});
};
	
function putRequest(name, age, id){
	$.ajax({
				url:'/edit',
				type:'PUT',
				data: {"name": name, "age": age, "id": id}
			}).done(function(response){
				console.log(response);
				var data = response;
				var li = $("#"+data.id);
				// var li = data.id;
				li.html("Name: " + data.name + " " + "Age: " + data.age + "</br><button class='edit'>Edit</button>");
		});
};

function deleteButtonListener() {
	var deleteButton = $('.delete');
		deleteButton.on("click", function() {
			console.log("Delete button working");
			var name = $('#name').val();
			var age = $('#age').val();
			var id = $(this).parent().attr("id");
			var li = $("#"+id);
				
			li.remove();
			deleteRequest(name, age, id);
		});
};

function deleteRequest(name, age, id){
	$.ajax({
				url:'/delete',
				type:'DELETE',
				data: {"name": name, "age": age, "id": id}
			}).done(function(response){
				console.log(response);
		});
};

	var submitButton = $('button#submit');
		submitButton.on("click", function(event) {
		event.preventDefault();
		var name = $('#name').val();
		var age = $('#age').val();
		var ul = $('ul');
		// console.log(event);
		// console.log("Button has been clicked");
		// console.log(name + " " + age);
		$.ajax({
			url:'/create',
			type:'POST',
			data: {"name": name, "age": age}
		}).done(function(data){
			console.log(data);
			ul.append("<li>" + "Name: " + name + " Age: " + age + "</br><button class='edit'>Edit</button></li>");
				addEventListeners()
		});
		
	});

});