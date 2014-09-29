var xhr = new XMLHttpRequest;

xhr.open('GET', './public/ny-baby-names.json', true)

xhr.send();

/*xhr.addEventListener('load', function(e) {
	var parsedResponse = JSON.parse(xhr.response);
	var url = document.querySelector("")
}
	)*/

