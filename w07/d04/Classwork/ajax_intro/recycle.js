var xhr = new XMLHttpRequest;

//three arguments: method, url, boolean
xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
xhr.send();

xhr.addEventListener('load', function(e){
	var parsedResponse = JSON.parse(xhr.reponse);
	var ul = document.querySelector("ul");

	for(var i = 0; i < parsedResponse.length; i++){
     var address = parsedResponse[i]["address"];
     var li = document.createElement("li");
     li.innerText = address;
     ul.appendChild(li);
	}
	
});

xhr.send();