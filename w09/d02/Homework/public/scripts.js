$(function(){

	var addButton = $('button#add');
	addButton.on("click", function() {
			addItem();
		});

	var deleteButton = $('button#delete');
	deleteButton.on("click", function() {
			deleteItem();
		});

	var purchasedButton = $('button#purchased');
	purchasedButton.on("click", function() {
			markAsPurchased();
		});
	
});		
	
function addItem() {
	var input = $('#add').val();
	var ul = $('ul');
	ul.append("<li id='list'><input type='checkbox' id='select' value="+input+">" + " " + input);
};

function deleteItem() {
	var listItems = $('ul').children();
	for(var i = 0; i < listItems.length; i++){
			if (listItems[i].children[0].checked == true){
				listItems[i].parentNode.removeChild(listItems[i]);
			};
		}
};

function markAsPurchased() {
	var listItems = $('ul').children();
	for(var i = 0; i < listItems.length; i++){
		if (listItems[i].children[0].checked == true){
		$("li").eq(i).addClass('strikethrough');
		};
	}
}

	// function makeCall() {
	// 	$.ajax({
	// 		url:'/',
	// 		type:'POST',
	// 		data: {'item': $('#add').val();}
	// 	}).done(function(data){
	// 		console.log(data);
	// 	});
	// };