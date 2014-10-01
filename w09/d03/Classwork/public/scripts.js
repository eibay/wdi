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
			ul.append("<li>" + "Name: " + people[i]["name"] + " " + "Age: " + people[i]["age"] + "<button class='edit' id='" + people[i]["id"] + "'>Edit</button></li>");
		}

		var editButton = $('button.edit');
		editButton.on("click", function(event) {
			console.log("This button works");
		// var id = $('#id').val();
			// $.ajax({
			// 	url:'/edit',
			// 	type:'PUT',
			// 	data: {name: name, age: age}
			// }).done(function(data){
			// 	console.log(data);
			// })
		})
	});

	var submitButton = $('button#submit');
		submitButton.on("click", function(event) {
		event.preventDefault();
		var name = $('#name').val();
		var age = $('#age').val();
		var ul = $('ul');
		// console.log(event);
		console.log("Button has been clicked");
		console.log(name + " " + age);
		$.ajax({
			url:'/create',
			type:'POST',
			data: {name: name, age: age}
		}).done(function(data){
			console.log(data);
			ul.append("<li>" + "Name: " + name + " Age: " + age + "</li>")

		});
	});

	var editButton = $('button#edit');

});