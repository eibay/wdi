var xhr = new XMLHttpRequest;

xhr.open("GET", "http://data.cityofnewyork.us/resource/sxx4-xhzg.json", true);



xhr.addEventListener("load", function(){
	var response = JSON.parse(xhr.response);
	
	for (var i = 0; i < response.length; i++) {
		var ul = document.querySelector("ul");
		var li = document.createElement("li");
		li.innerText = response[i]["address"];
		ul.appendChild(li);
	}
});

xhr.send();

	