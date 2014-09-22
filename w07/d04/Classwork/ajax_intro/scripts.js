var xhr = new XMLHttpRequest;

//three arguments: method, url, boolean
xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
xhr.send();

xhr.addEventListener('load', function(e){
	var results = xhr.response
	data = JSON.parse(xhr.reponse)
	console.log(results);
})

//
