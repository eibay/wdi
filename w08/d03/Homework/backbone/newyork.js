var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://data.cityofnewyork.us/resource/kn7u-vdxr.json')

xhr.send();

xhr.addEventListener('load', function(e){
	console.log("callback in event has been fired");
	console.log(e);
	console.log(xhr.response);











});










