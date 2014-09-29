var xhr = new XMLHttpRequest;

xhr.open('GET', 'https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json', true);
xhr.send();

xhr.addEventListener('click', function(e){
	console.log(xhr.response);
	console.log(e);
});
