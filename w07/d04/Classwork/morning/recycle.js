var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);

xhr.addEventListener('load', function(e) {
	var parsedResponse = JSON.parse(xhr.response);
	var ul = document.querySelector('ul');

	for (var i = 0; i < parsedResponse.length; i++) {
		var address = parsedResponse[i]["address"];
		var li = document.createElement("li");
		li.innerText = address;
		ul.appendChild(li);
	}


	// console.log(parsedResponse[0]);
	// console.log(xhr.response);
	// console.log(e);
	// console.log(typeof(xhr.response));
});

xhr.send();
