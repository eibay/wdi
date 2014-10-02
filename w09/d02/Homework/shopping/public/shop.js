var shopList = ["milk", "eggs", "bacon"];
var $list;
function makeList(shopList){
	$list = $("ul");
	for (i = 0; i < shopList.length; i++) {
		$list.append("<li><input type='checkbox' id='strikeItem'>" + shopList[i] + "</li>");
	} 
};

function markPurchased() {
	var listItems = $('ul').children();
	for(var i = 0; i < listItems.length; i++){
		if (listItems[i].children[0].checked == true){
		$("li").eq(i).addClass('strike');
		};
	}
}

function addItem() {
	var input = $('#itemAdd').val();
	var ul = $('ul');
	ul.append("<li><input type='checkbox' id='strikeItem'>" + input + "</li>");
}



$(function(){

makeList(shopList);

var button =$('button#add');
button.on("click", function() {
	addItem();
})

var purchasedButton = $('button#purchased');
	purchasedButton.on("click", function() {
	markPurchased();
});




});