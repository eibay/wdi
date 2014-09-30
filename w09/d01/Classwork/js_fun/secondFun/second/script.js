window.onload = function(){
	$("body").append("<ul>")
	$.get("https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json", "json", success)
}

function success(feed){
	$("input").keyup(feed, chamberList)
}


function chamberList(feed) {
	// console.log(feed.data.data)
	if ($("input")[0].value.length == 5) {
		console.log("ok")
		var list = []
		feed.data.data.forEach(function(hotspot) {
			if (hotspot[15] == $("input")[0].value && list.length <= 10) {
				list.push(hotspot)
			}
			list.forEach(function(hotspot){
				var string = "Name: " + hotspot[9] + ", Address: " + hotspot[10] + ", Cost: " + hotspot[15]
				$("ul").append("<div>" + string + "</div>")
			})
		})
	}
}
	