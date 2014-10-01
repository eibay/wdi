function postRequest(name, age) {
	$.ajax({
	type: "POST",
	url: "/create",
	data: {"name": name, "age": age}
	}).done(function(response){
		console.log("Post request sent.")
			var $ul = $("ul")
			var response = JSON.parse(response)
			$ul.append("<li>" + response["name"] + " - " + response["age"] + "<button class='edit' id='"+ response["id"]+ "'>Edit</button></li>");
	})
}

$(function(){

$.ajax({
	type: "GET",
	url: "/view_all",
	}).done(function(data){
	var $ul = $("ul")
	var data = JSON.parse(data)
	for	(var i = 0; i < data.length; i++) {
		$ul.append("<li>" + data[i]["name"] + " - " + data[i]["age"] + "<button class='edit' id='"+ data[i]["id"]+ "'>Edit</button></li>");
		};
	})


var $button = $("button")

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