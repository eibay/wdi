var button = document.querySelector('button');
var input = document.querySelector('input');
button.addEventListener('click', function() {
	fetch(input.value);
})

var ul = document.querySelector('ul');

function fetch(location){
	var xhr = new XMLHttpRequest();

	xhr.addEventListener('load', function() {

		photos = JSON.parse(xhr.response);

		for (var i = 0; i < photos.length; i++) {
			var li = document.createElement('li');
			li.innerHTML = '<img src=\"' + photos['data'][i]['images']['low_resolution']['url'] + '\">';
			ul.appendChild(li);
		}
	});

	xhr.open('GET', '/photos?loc=' + location.split(' ').join('+'));
	xhr.send();
}