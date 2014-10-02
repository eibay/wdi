function addItem() {
	var input = $('#text').val();
	var ul = $('ul');
	listenToCheck($(ul).append("<li><input type='checkbox'/>" +input));
}

// function addItem(item, quant) {
	
// 	$.post('/', {item: item, quantity: quant}).done(function(res) {
// 	console.log(res)
// 	jsonRes = JSON.parse(res);
			
// 	var listItem = '<li id="'+jsonRes['id']+'">'+item+'</li>'
// 	$('.to-buy').append(listItem);

// 	});
// }


function deleteItem() {
	var listItems = $('ul').children();
	for(var i = 0; i < listItems.length; i++){
			if (listItems[i].children[0].checked == true){
				listItems[i].parentNode.removeChild(listItems[i]);
				};
			}
}

$(function(){

	var addButton = $('button#add');
	addButton.on("click", function() {
		console.log("add click");
			addItem();
		});

	var deleteButton = $('button#delete');
	deleteButton.on("click", function() {
		console.log("delete click");
			deleteItem();
		});

});		

// not working
function listenToCheck(checkbox) { 
   checkbox.addEventListener("click", function(event) {
   check = event.target;
   check.parentNode.setAttribute("style", "text-decoration:line-through;")
   });
 }