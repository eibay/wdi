var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://www.omdbapi.com/?t=True%20Grit', true);
xhr.send();

xhr.addEventListener('load', function(e){
	console.log(xhr.response);
	console.log(e);
});