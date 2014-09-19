var xhr = new XMLHttpRequest;

xhr.open("GET", 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true)
xhr.send();


xhr.addEventListener('load', function(e) {
	console.log(xhr.response);
	console.log(e);

	var address = JSON.parse(xhr.response);
	var ul = document.querySelector('ul');


	for(i = 0; i < address.length; i++){
	var address_display = address[i]["address"];
	var li = document.createElement('li')
	li.innerText = address[i]
	ul.appendChild(li)
	}
});
