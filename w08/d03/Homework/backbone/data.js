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
		var phone = parsedResponse[i]["phone"];
		var facility = parsedResponse[i]["facility_name"];
		var type = parsedResponse[i]["facility_type"];
		var borough = parsedResponse[i]["borough"];
		var li = document.createElement("li");
		li.innerHTML = "<html><b>Name:</b> </html>" + facility + "<html><br><b>Facility Type:</b> </html>" + type + "<html><br><b>Borough:</b> </html>" + borough; "<html><b>Facility Type:</b> </html>" + type + "<html><b>Phone:</b> </html>" + phone;
		ul.appendChild(li);		

	}	

});