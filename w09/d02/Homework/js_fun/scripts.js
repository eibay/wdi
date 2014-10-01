window.addEventListener('load', function() {
	var button = document.querySelector('button');
	button.addEventListener('click', function() {
		var request = new XMLHttpRequest();
		request.open('GET', 'https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json', true);
		request.send(null);
		request.addEventListener('load', function(){

		})
	})
})

// need help with api request in ajax