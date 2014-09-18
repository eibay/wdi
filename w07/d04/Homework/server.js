var http = require('http')
var request

var ul = document.querySelector('ul');

function retrieve(city, tag) {
	var xhr = new XMLHttpRequest;

	xhr.open('GET', "https://api.instagram.com/v1/media/search?city='new_york'&client_id=4ad7cc36c172434588afd340aa74cd01", true);
	xhr.send();

	xhr.addEventListener('load', function() {
		ul.innerText = 
	})
}



	("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=4ad7cc36c172434588afd340aa74cd01")