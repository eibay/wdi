var xhr = new XMLHttpRequest;

xhr.open('GET', 'https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json')

xhr.send();

xhr.addEventListener('click', function(e){

	var parsedResponse = JSON.parse(xhr.response);
	var button = document.querySelector("button");
	var ul = document.querySelector("ul");

	for (var i = 0; i < parsedResponse.length; i++) {
		var location = parsedResponse[i]["name"];
		var li = document.createElement("li");
		li.innerHTML = "<html><b>Location:</b>" + location;
		ul.appendChild(li);	
	}
});