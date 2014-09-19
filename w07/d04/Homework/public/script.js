window.addEventListener('load', function() {
	var button = document.getElementById("button");
	button.addEventListener('click', function() {

		var city = getCity(); 
		var search = getSearch();
		console.log(city);
		console.log(search); 
		var requestURL = assembleRequestUrl(city, search); 
		var httpRequest = new XMLHttpRequest; 
		httpRequest.open('GET', requestURL, true);
		httpRequest.send(null);  
		httpRequest.addEventListener('load', function() {
			var picturesUl = document.getElementById("pictures"); 
			var srcArray = JSON.parse(httpRequest.response);
			console.log(srcArray);
			for (var i = 0; i < srcArray.length; i++) {
				var src = srcArray[i]; 
				displayPicture(picturesUl, src);
			}
		})
	})
})

function getCity() {
	var cityInput = document.getElementById("city");
	return cityInput.value; 
}

function getSearch() {
	var searchInput = document.getElementById("search");
	return searchInput.value; 
}

function assembleRequestUrl(city, search) {
	var requestURL = "/pictures"
	requestURL += "?search=" + encodeURIComponent(search) 
	return requestURL + "&city=" + encodeURIComponent(city); 
}

function displayPicture(parent, src) {
	var img = document.createElement('img');
	img.setAttribute('src', src); 
	parent.appendChild(img); 
}