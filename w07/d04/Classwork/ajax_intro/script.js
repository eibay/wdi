var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
xhr.send();


xhr.addEventListener('load', function(event) {
	
	trashArray = JSON.parse(xhr.response)
	ul = document.querySelector('ul');

	for(i=0; i < trashArray.length; i++) {
		new_li = document.createElement('li');

		if (trashArray[i]["address"] != undefined && trashArray[i]["borough"] == "Staten Island") {
		new_li.innerText = trashArray[i]["address"];
		ul.appendChild(new_li);
		}
	}
})


