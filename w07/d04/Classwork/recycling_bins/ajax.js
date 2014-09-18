window.addEventListener('load', function() {
	console.log("The window loaded.");
	var httpRequest = new XMLHttpRequest 
	httpRequest.addEventListener('load', function() {
		var recycBinJSONs = JSON.parse(httpRequest.response); 
		for (var i = 0; i < recycBinJSONs.length; i++) {
			var recycBinJSON = recycBinJSONs[i];

			var recycBinAddress = recycBinJSON.address; 
			var recycBinSiteType = recycBinJSON.site_type; 
			var recycBinBorough =  recycBinJSON.borough; 
			var recycBinParkSiteName = recycBinJSON.park_site_name; 

			// query Google maps for recyc bin 
			var recycBinLat = recycBinJSON.latitude; 
			var recycBinLon = recycBinJSON.longitude; 
			appendRecycBin(recycBinAddress, 
				recycBinBorough, 
				recycBinParkSiteName, 
				recycBinSiteType); 
		} 
	})
	httpRequest.open(
		'GET', 
		"http://data.cityofnewyork.us/resource/sxx4-xhzg.json", 
		true);
	httpRequest.send(
		null); 

}) 

function appendRecycBin(addr, borough, park_site_name, type) {
	var recyclingBinList = document.getElementById("recyling_bins_list"); 
	var li = document.createElement('li');
	var para = document.createElement('p'); 
	var args = [addr, borough, park_site_name, type]; 
	var names = ["Address: ", "Borough: ", "Park: ", "Type: "]
	for (var j = 0; j < args.length; j++) {
		var span = document.createElement('span'); 
		span.innerText = names[j] + args[j]; 
		para.appendChild(span); 
		para.appendChild(document.createElement('br')); 
	} 
	 
	li.appendChild(para); 
	recyclingBinList.appendChild(li); 
}
