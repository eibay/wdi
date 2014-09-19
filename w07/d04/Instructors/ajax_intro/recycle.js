var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true)

xhr.send();

xhr.addEventListener('load', function(){
	console.log("Callback in event has been fired");
	var parsedResponse = JSON.parse(xhr.response);
	var ul = document.querySelector("ul");

	for(var i = 0; i < parsedResponse.length; i++){
		var address = parsedResponse[i]["address"];
		var li = document.createElement("li");
		li.innerText = address;
		ul.appendChild(li);
	}

});

for(var i = 0; i < 10000; i++){
	console.log(i);
};