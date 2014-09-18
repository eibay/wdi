window.onload = function() {
	var xhr = new XMLHttpRequest(); 

	xhr.open('GET', "http://www.omdbapi.com/?t=True%20Grit", true);
	xhr.send(null);

	xhr.addEventListener("load", function() {
		console.log(xhr.response); 
	}); 
}