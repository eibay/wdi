var button = document.querySelector('button');
		var input = document.querySelector('input');
		button.addEventListener('click', function() {
			fetch(input.value);
		})

function fetch(location){
	var xhr = new XMLHttpRequest();

	xhr.addEventListener('load', function() {

		var insta = JSON.parse(xhr.response);
		
		for (var i = 0; i < insta['data'].length; i++) {
		var ul = document.querySelector('ul');

			var li = document.createElement('li');
			li.innerHTML = '<img src=\"' + insta['data'][i]['images']['low_resolution']['url'] + '\">';
		ul.appendChild(li);
		}
	});

	xhr.open('GET', '/photos?loc=' + location.split(' ').join('+'), true);
	xhr.send();
}