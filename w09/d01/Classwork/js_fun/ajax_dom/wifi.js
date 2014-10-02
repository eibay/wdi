// var xhr = newXMLHTTPRequest

// xhr.open = ('GET', 'https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json', true)

// xhr.send();
var wifiArr;

$.ajax({
	url: "https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json",
	context: document.body
}).done(function(data){
	wifiArr = data["data"];
});
// Create an html page and a button.
// When you press the button you should see a list with names and street address of 10 wifi hotspots in NYC.
// Make an ajax call to this endpoint to get the wifi hotspot data - https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json

for(var i = 0; i < 10; i++){
	return wifiArr[i][]
};



