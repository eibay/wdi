// 1. Simple
// * Create an html page and a button.
// * When you press the button you should see a list with names of 10 wifi hotspots in NYC.
// * Make an ajax call to this endpoint to get the wifi hotspot data - `https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json`

var xhr = new XMLHttpRequest;
xhr open ('GET', 'https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json', true)
xhr.send();


xhr.addEventListener('click', function() {
	console.log("click test");
	var parsed_data = JSON.parse(xhr.response);
	var ul = document.querySelector("ul");

	for(var i = 0; i < parsed_data.length; i++){
		var wifi_data = parsed_data["data"][i][9];
		var li = document.createElement("li");
		li.innerText = ["data"][i][9];
		ul.appendChild(li);
	}
});
