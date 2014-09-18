window.addEventListener('load', function() {
	console.log("The window loaded.");
	var httpRequest = new XMLHttpRequest 
	httpRequest.addEventListener('load', function() {
		console.log(httpRequest.response); 
	})
	httpRequest.open(
		'GET', 
		"http://data.cityofnewyork.us/resource/sxx4-xhzg.json", 
		true);
	httpRequest.send(
		null); 

}) 