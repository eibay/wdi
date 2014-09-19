var photos = document.getElementById('photos');

function retrieveCity(lat, lng) {
	var xhr = new XMLHttpRequest();

	xhr.addEventListener('load', function(){ 
		
		photos.innerHTML = ''
		var jsonRes = JSON.parse(xhr.response);
		var data = jsonRes['data'];

		for(i=0; i < data.length; i++){
			var imgURL = data[i]["images"]["low_resolution"]["url"];
			image = document.createElement('img');
			image.src = imgURL;
			photos.appendChild(image);
		}
	});
	xhr.open('GET', '/city-pics?lat=' + encodeURIComponent(lat) + '&lng=' + encodeURIComponent(lng));
    xhr.send();
}

// function retrieveTag(tag) {
// 	var xhr = new XMLHttpRequest();

// 	xhr.addEventListener('load', function(){ 
		
// 		photos.innerHTML = ''
// 		var jsonRes = JSON.parse(xhr.response);
// 		var data = jsonRes['data'];

// 		for(i=0; i < data.length; i++){
// 			var imgURL = data[i]["images"]["low_resolution"]["url"];
// 			image = document.createElement('img');
// 			image.src = imgURL;
// 			photos.appendChild(image);
// 		}
// 	});
// 	xhr.open('GET', '/tag-pics?tag=' + encodeURIComponent(tag));
//     xhr.send();
// }