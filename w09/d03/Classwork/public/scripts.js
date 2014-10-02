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
			ul.append("<li id='"+ people[i]["id"]+ "'>" + "Name: " + people[i]["name"] + " " + "Age: " + people[i]["age"] + "<button class='edit'>Edit</button></li>");
		}
			addEventListeners()
	})

function addEventListeners() {
	var $editButton = $('button.edit');
	$editButton.on("click", function(){
		$(this).parent().append("<input id='name' placeholder='Update name' </input><input id='age' placeholder='Update age' </input><button class='save'>Save Changes</button>");
			saveChangesListener()	
	});
};

function saveChangesListener() {
	var saveChanges = $('button.save');
		saveChanges.on("click", function() {
				$.ajax({
				url:'/edit',
				type:'PUT',
				data: {"name": name, "age": age}
			}).done(function (response){
				var response = JSON.parse(response)
				ul.append("<li>" + response["name"] + response["age"] + "</li>");
		});
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
			ul.append("<li>" + "Name: " + name + " Age: " + age + "<button class='edit'>Edit</button>" + "</li>");
				addEventListeners()
		});
		
	});

});