var currentId;

// issues to address:
// *** == edit button does not appear on newly created person
// *** == if you click an edit button more than one time, you get an additional edit form

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
			currentId = this.id;
			var $editContainer = $('div#editContainer');

			$editContainer.append("<h3>edit the person</h3><span>change the name:</span><input class='editName'><span>change the age:</span><input class='editAge'><button id='changeIt'>change it</button>");
			editPersonAjax(currentId);
		
		});

// listen for the change-it button to commit your changes to the database
	function editPersonAjax(){
		console.log("id is " + currentId);

		$('button#changeIt').on("click", function(){
			var editName = $('input.editName').val();
			var editAge = $('input.editAge').val();
			console.log("currentId is " + currentId) 

			// hit the server with the new information
				$.ajax({
					url: '/edit',
					type: 'PUT',
					data: {
						name: editName,
						age: editAge,
						id: currentId
						}
					}).done(function(data){
						var changedPerson = JSON.parse(data);
						var $ul = $('ul');
						var $changedId = changedPerson["id"];
						var $changedLi = $('button#' + $changedId).parent();
						console.log(typeof($changedLi));
						console.log('this list item will change' + $changedLi);
						// *** but I need to change the existing li instead of appending *** //
						// $ul.append("<li>" + changedPerson["name"] + "<br>" + changedPerson["age"] + "</li>");

						$changedLi.attr("name", changedPerson["name"]);
						$changedLi.attr("age", changedPerson["age"]);
						

					})
		})
	};

// create a new person
	var button =$('button#submit_button');

	button.on("click", function(e) {
		e.preventDefault();
		console.log("button clicked");
	
		var name = $('#name').val();
		var age = $('#age').val();
		$.ajax({
			url: '/create',
			type: 'POST',
			data: {
				name: name,
				age: age
			}
		}).done(function(data){
			var newPerson = JSON.parse(data);
			// console.log(typeof(data));
			// console.log("data is " + data);
			// console.log("newPerson is " + newPerson);
			// console.log("newPerson name is " + newPerson["name"])
			var $ul = $('ul');
			$ul.append("<li>" + newPerson["name"] + "<br>" + newPerson["age"] + "</li>");
		})
	
	})







});

// here is the end of the onLoad function
});

