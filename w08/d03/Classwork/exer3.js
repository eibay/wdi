console.log('i see you')

var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://127.0.0.1:2000/names', true);

xhr.send();
	
xhr.addEventListener('load', function(e){
	console.log("Callback in event has been fired");
	console.log(xhr.response);
	console.log(e);

});






