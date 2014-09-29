var xhr = new XMLHttpRequest;

xhr.open('GET', 'https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json');

// need to add EventListener to button to send the call
button = document.querySelector('button');
button.addEventListener('click', function(){
	xhr.send();
});

xhr.addEventListener('load', function(e){
	console.log(e);
	console.log(xhr.response);

	var parsedResponse = JSON.parse(xhr.response);
	console.log(parsedResponse);
	var ul = document.querySelector("ul");

	for (var i = 0; i < 10; i++) {

	}








});
