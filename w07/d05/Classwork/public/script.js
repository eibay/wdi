window.addEventListener('load', function() {
	var theButton = document.querySelector("button");
	theButton.addEventListener('click', function() {
		var movieTitle = getSearchInput();
		movieTitle = encodeURIComponent(movieTitle);
		var httpRequest = new XMLHttpRequest;

		httpRequest.open('GET', 
			"/search?title=" + movieTitle, 
			true);
		httpRequest.send(null);
		httpRequest.addEventListener('load', function() {
			var posterImgSrc = httpRequest.response; 
			addPosterImg(posterImgSrc);
		})

	})
})

function getSearchInput() {
	var searchInput = document.querySelector("input#search_input");
	return searchInput.value;
}

function addPosterImg(src) {
	var searchResults = document.querySelector("ul#search_results");
	var resultItem = document.createElement('li');
	var resultImage = document.createElement('img');
	resultImage.setAttribute('src', src);
	resultItem.appendChild(resultImage); 
	search_results.appendChild(resultItem); 
}