window.addEventListener('load', function() {
	console.log("window loaded!");
	var xhr = new XMLHttpRequest(); 

	xhr.open('GET', "http://www.omdbapi.com/?t=True%20Grit", true);
	xhr.send(null);

	xhr.addEventListener('load', function(e) {
		console.log(xhr.response); 
		console.log(e); 
	}); 
}) 