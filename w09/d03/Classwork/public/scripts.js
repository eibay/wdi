
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
			$ul.append("<li>" + name + age + "</li><button class='edit' id=" + data["id"] + ">edit</button>");
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
				$ul.append("<li id='person-'" + persons[i]['id'] + ">" + persons[i]["name"]+ persons[i]["age"] + "</li><button class='edit' id=" + persons[i]["id"] + ">edit</button>");
			}
			$('.edit').click(appendEditForm);
		})
	}

	function appendEditForm() {
		var personID = this.id;
		$(this).after('<form>').after('<input id="name-' + this.id + '" type="text" placeholder="name">').after('<input id="age-' + this.id + '" type="text" placeholder="age">').after('<button class ="update" type="button">Edit Name');
			       // .on(events, handler) 
		$('.update').on("click", updateRecord(personID));
	}
   // events) One or more space-separated event types.
   // handler) 

	function updateRecord(id) {
		console.log(id); 
		var newName = $('#name-' + id).val();
		var newAge = $('#age-' + id).val();
		console.log("newName");
		console.log("newAge");
		console.log("id");
		$.ajax({
		url: "http://127.0.0.1:4567/edit",
		type: "PUT",
		data: {"name": newName,
					"age": newAge,
					"id": id}
		}).done(function(data) {
			console.log(data);
		})
	}
	







	
