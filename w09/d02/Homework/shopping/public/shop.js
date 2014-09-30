var shopList = ["milk", "eggs", "bacon"];

function makeList(shopList){
	var $list = $("ul");
	for (i = 0; i < shopList.length; i++) {
		$list.append("<li>" + shopList[i] + "</li>");
	} 
};

$(function(){

makeList(shopList);






});