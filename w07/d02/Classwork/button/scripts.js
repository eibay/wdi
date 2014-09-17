window.onload = function() {
		document.getElementById('add').addEventListener("click", function(){
		var text = document.getElementById('user_input').value;
		document.getElementById('user_input').value = "";
		var lists = document.body.querySelector('ul');
		var list = document.createElement('li');
		list.innerText = text;
		lists.appendChild(list);
	});
		document.getElementById('delete').addEventListener("click", function(){
		var text = document.getElementById('user_input').value;
		document.getElementById('user_input').value = "";
		var lists = document.body.querySelectorAll('ul li');
		for(var i=0;i<lists.length;i++) {
			if(lists[i].innerText == text) {
				lists[i].parentElement.removeChild(lists[i]);
			};
		};
	});
};			