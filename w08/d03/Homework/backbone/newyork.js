var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://data.cityofnewyork.us/resource/kn7u-vdxr.json')

xhr.send();

xhr.addEventListener('load', function(e){
	console.log("callback in event has been fired");
	console.log(e);
	console.log(xhr.response);

	var parsedResponse = JSON.parse(xhr.response);
	var ul = document.querySelector("ul");

	for (var i = 0; i < parsedResponse.length; i ++) {
		var name = parsedResponse[i]["facility_name"];
		var ftype = parsedResponse[i]["facility_type"];
		var borough = parsedResponse[i]["borough"];
		var li = document.createElement("li");
		li.innerHTML = "<html>Name: </html>" + name + "<html><br>Facility Type: </html>" + ftype + "<html><br>Borough: </html>" + borough;
		ul.appendChild(li);		

	}	





});
