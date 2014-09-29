window.onload = function(){
	$("body").append("<ul>")
	$.get("https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json", "json", success)
}

function success(feed){
	$("input").keyup(feed, chamberList)
}


function chamberList(feed) {
	console.log(feed.data.data)
	
	// console.log(list)
	// list.forEach(function(hotspot){
	// 	var string = "Name: " + hotspot[9] + ", Address: " + hotspot[10] + ", Cost: " + hotspot[15]
	// 	$("ul").append("<div>" + string + "</div>")
	// })
}