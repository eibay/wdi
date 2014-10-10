$(function(){

	var PersonView = Backbone.View.extend({
		
		tagName: "li",

		events: {
			"click button.delete" : "destroy",
			"click button.edit" : "toggleEdit",
			"click input.stricken" : "strike",
		},

		destroy: function() {
			this.model.destroy();
		},

		strike: function() {
			this.model.set('style', 'text-decoration:strike-through');
			this.model.save();
		},

		toggleEdit: function () {
			console.log("toggleEdit")
		},

		initialize: function(personHash){
			console.log("New PersonView instance created");
			this.name = personHash.name;
			this.age = personHash.age;
			this.style = personHash.style;
		},
	// note how this.id is set automatically
		render: function(){
			var personHTML = "<li id='"+ this.id+ "' style='" + this.style +"'>" + this.name + " - " + this.age + "<input class='stricken' type='checkbox'/><button class='edit' >Edit</button><button class='delete' >Pardon</button></li>"
			this.$el.html(personHTML)
		}
	});


	$.get("/view_all", function(response) {
		console.log(response)
		console.log(response.length)
			_.each(response, function(person){
				var view = new PersonView({id: person["id"], name: person["name"], age: person["age"], style: "text-decoration:none"})
				view.render();

				$("ul").append(view.el);
		});
	});
		
	// function putRequest(name, age, id) {
	// 	$.ajax({
	// 	type: "PUT",
	// 	url: "/edit",
	// 	data: {"name": name, "age": age, "id": id}
	// 	}).done(function(response){
	// 		console.log("Put request sent.")
	// 			var $ul = $("ul")
	// 			var response = JSON.parse(response)
	// 			$ul.append();
	// 	})
	// }


	// function postRequest(name, age) {
	// 	$.ajax({
	// 	type: "POST",
	// 	url: "/create",
	// 	data: {"name": name, "age": age}
	// 	}).done(function(response){
	// 		console.log("Post request sent.")
	// 			var $ul = $("ul")
	// 			var response = JSON.parse(response)
	// 			$ul.append();
	// 		addEditListeners()
	// 	})
	// }

	// function addEditListeners() {
	// 	var $editButton = $("button.edit");
	// 	$editButton.on("click", function(){
	// 		$(this).parent().append("<input id='newName' placeholder='New Name' </input><input id='newAge' placeholder='New Age' </input><button class='saveChanges'>Save Changes</button>");
	// 		addSaveChangesListener();
	// 	});
	// };
	
	// function addSaveChangesListener(){
	// 	var $saveChangesButton = $("button.saveChanges");
	// 	$saveChangesButton.on("click", function(){
	// 		var id = $(this).parent().attr("id")
	// 		var $newNameInput = $("input#newName")
	// 		var $newAgeInput = $("input#newAge")
	// 		var newName = $newNameInput.val();
	// 		var newAge = $newAgeInput.val();
	// 		putRequest(newName, newAge, id)
	// 	});
	// };	

	// var $button = $("button#add")

	// $button.on("click", function(event){
	// 	event.preventDefault();
	// 	console.log("button has been clicked");
	// 	var $ageInput = $("input#age");
	// 	var $nameInput = $("input#name");
	// 	var name = $nameInput.val();
	// 	var age = $ageInput.val();
	// 	console.log(age);
	// 	console.log(name);
	// 	postRequest(name, age);
	// 	$('.form-inline').trigger("reset");
	// });


});

