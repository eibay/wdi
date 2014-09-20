window.onload = function(){
	var button = document.querySelector('button');
	var input = document.querySelector('input');
	button.addEventListener('click', function(){
		fetch(input.value);
	})

	function fetch(thing){
		var xhr = new XMLHttpRequest();
		xhr.addEventListener('load', function(){
			var movie = JSON.parse(xhr.response);
	
			var ul = document.querySelector('ul');
			var li = document.createElement('li');
			li.innerHTML = '<h3>' + movie['Title'] + '(' + movie['Year'] + ')</h3><img src=\"' + movie['Poster'] + '\">'
			ul.appendChild(li)

		})
		xhr.open('GET', 'http://www.omdbapi.com/?t=' + thing, true);
		xhr.send();
	}
}
