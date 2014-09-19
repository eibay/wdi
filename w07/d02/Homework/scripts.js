window.onload = function(){

	document.getElementById('add_todo').addEventListener('click', function(){
		var text = document.getElementById('user_input').value;
		document.getElementById('user_input').value = "";
		var list = document.createElement('li');

		var checkbox_remove = document.createElement('input');
		checkbox_remove.type = "checkbox";
		checkbox_remove.name = "remove";
		checkbox_remove.value = "remove";

		var up_arrow = document.createElement('button');
		up_arrow.name = "up_arrow";
		up_arrow.innerText = "Up";

		var down_arrow = document.createElement('button');
		down_arrow.name = "down_arrow";
		down_arrow.innerText = "Down";

		var checkbox_done = document.createElement('input');
		checkbox_done.type = "checkbox";
		checkbox_done.name = "done";
		checkbox_done.value = "done"; 

		checkbox_remove.addEventListener('click', function(event) {
			event.target.parentElement.remove();
		});

		checkbox_done.addEventListener('click', function(event) {
			event.target.parentElement.setAttribute("style", "text-decoration: line-through");
			var text = document.getElementById('completed').innerText;
			document.getElementById('completed').innerText = Number(text) + 1;
		});


		up_arrow.addEventListener('click', function(event) {
			var list = event.target.parentNode;
			var previous_list = list.previousSibling;
			document.querySelector('ul').insertBefore(list, previous_list);
		});

		down_arrow.addEventListener('click', function(event) {
			var list = event.target.parentNode;
			var next_list = list.nextSibling;
			document.querySelector('ul').insertBefore(next_list, list);
		});

		list.innerText = text;
		var lists = document.querySelector('ul');
		list.appendChild(checkbox_done);
		list.appendChild(checkbox_remove);
		list.appendChild(up_arrow);
		list.appendChild(down_arrow);
		lists.appendChild(list);
		var first_list = document.querySelectorAll('li')[0];
		document.querySelector('ul').insertBefore(list, first_list);
	});

};