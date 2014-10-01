var name = $('#name').val();
var age = $('#age').val();

$(function(){

	$.ajax({
		url: '/first',
		type: 'GET'
	}).done(function(data){
			var peoples = JSON.parse(data);
			console.log(peoples);
			var $ul = $('ul');
			for (i=0; i<peoples.length; i++) {
			$ul.append("<li>" + peoples[i]["name"] + "<br>" + peoples[i]["age"] + "<button class='edit' id='" + peoples[i]["id"] + "'>edit</button></li>");
		}
// click the button next to the person that you wish to edit
		var buttonEdit = $('button.edit');
		buttonEdit.on("click", function(e) {
// input fields are created to make your edit for the person
			var currentButton = this;
			var currentId = this.id;
			var $editContainer = $('div#editContainer');
			$editContainer.append("<h3>edit the person</h3><span>change the name:</span><input class='editName'><span>change the age:</span><input class='editAge'><button id='changeIt'>change it</button>");

// listen for the change it button to commit your changes to the database
				var editName = $('input.editName').val();
				var editAge = $('input.editAge').val();
				$('button#changeIt').on("click", function() {
				// hit the server with the new information
					$.ajax({
						url: '/edit',
						type: 'PUT',
						data: {
							name: editName,
							age: editAge,
							id: this.id
						}
					})


				});

		});

	});


	var button =$('button#submit_button');
	button.on("click", function(e) {
		e.preventDefault();
		// console.log(e);
		console.log("button clicked");
		var name = $('#name').val();
		var age = $('#age').val();
		// console.log(name);
		// console.log(age);
		$.ajax({
			url: '/create',
			type: 'POST',
			data: {
				name: name,
				age: age
			}
		}).done(function(data){
			console.log(data);
			// make append here
			var $ul = $('ul');
			$ul.append("<li>" + name + "<br>" + age + "</li>");
		})


		})









});










