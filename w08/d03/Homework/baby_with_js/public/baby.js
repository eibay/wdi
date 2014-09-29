var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://127.0.0.1:4567/', true)

xhr.send();

xhr.addEventListener('load', function(){
	console.log("Callback in event has been fired");
	// console.log(xhr.response); 


});

