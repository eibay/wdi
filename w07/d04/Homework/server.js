var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

var server = http.createServer();

server.on('request', function(request, response) {
  var parsedRequest = url.parse(request.url, true);
  console.log("Request received to: " + parsedRequest.pathname)

  if (parsedRequest.pathname == '/') {
    response.end(fs.readFileSync('./index.html'));
  } else if (parsedRequest.pathname == '/movies') {
    // var movieTitle = parsedRequest.query.title;
    var imageSearch = parsedRequest.query.title;

    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
    });
  }
});


var button = document.getElementById("button");
button.addEventListener('click', function() {
	var city= getCity();
	var search = getSearch();
	var requestURL = getRequestURL();
})


function getCity(){

}

function getSearch(){

}

function getRequestURL(){
	
}









window.addEventListener('load', function() {
	var button = document.getElementById("button");
	button.addEventListener('click', function() {
		var city = getCity(); 
		var search = getSearch();
		var requestURL = assembleRequestUrl(city, search); 
		var httpRequest = new XMLHttpRequest; 
		httpRequest.open('GET', requestURL, true);
		httpRequest.send(null);  
		httpRequest.addEventListener('load', function() {
			var picturesUl = document.getElementById("pictures"); 
			var srcArray = JSON.parse(httpRequest.response);
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