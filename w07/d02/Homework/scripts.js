window.onload = function(){

	document.getElementById('add_todo').addEventListener('click', function(){
		var text = document.getElementById('user_input').value;
		document.getElementById('user_input').value = "";
		var list = document.createElement('li');

		var checkbox = document.createElement('input');
		checkbox.type = "checkbox";
		checkbox.name = "remove";

		var up_arrow = document.createElement('button');
		up_arrow.name = "up_arrow";
		up_arrow.innerText = "Up";

		var down_arrow = document.createElement('button');
		down_arrow.name = "down_arrow";
		down_arrow.innerText = "Down";

		checkbox.addEventListener('click', function(event) {
			event.target.parentElement.remove();
		});

		// up_arrow.addEventListener('click', function(event) {
		// 	var list = event.target.parentNode;
		// 	var previous_list = list.previousSibling;
		// };

		list.innerText = text;
		var lists = document.querySelector('ul');
		list.appendChild(checkbox);
		list.appendChild(up_arrow);
		list.appendChild(down_arrow);
		lists.appendChild(list);
		var first_list = document.querySelectorAll('li')[0];
		document.querySelector('ul').insertBefore(list, first_list);
	});

};