var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
xhr.send();

xhr.addEventListener('load', function(e) {
	console.log(xhr.response);
	// console.log(e);
	var ul = document.querySelector('ul');
	
	var data = JSON.parse(xhr.response);

	for (var i = 0; i < data.length; i++) {
		if (data[i]['borough'] == 'Brooklyn') {
			var li = document.createElement('li');
			li.innerText = data[i]['address'];
			ul.appendChild(li);
		}
	} 
})
