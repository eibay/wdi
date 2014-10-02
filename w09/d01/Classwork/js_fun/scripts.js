var button = $("button")
button.on("click", function(){
var hotspotsFull = $.getJSON( "https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json", function() {

	alert( "success" );
	var hotspots = hotspotsFull["data"]
	
	var ul = document.createElement("ul");
	var li = document.createElement("li");
	_.each(hotspots, function(){
		
	})
});
})