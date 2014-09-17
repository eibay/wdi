window.onload = function() {

	document.getElementById('add_todo').addEventListener("click", function(){
		var text = document.getElementById('user_input').value;
		document.getElementById('user_input').value = "";
		var lists = document.body.querySelector('ul');
		var list = document.createElement('li');
		list.innerText = text;
		lists.appendChild(list);
		var first_list = document.querySelectorAll('li')[0];
		document.querySelector('ul').insertBefore(list, first_list);
	});

	var checkbox= document.createElement('input')
	checkbox.type= "checkbox"

	checkbox.addEventListener('click', function(event) {
		event.target.parentElement.remove();
	});




	document.getElementById('delete').addEventListener("click", function(){
		var text = document.getElementById('user_input').value;
		document.getElementById('user_input').value = "";
		var lists = document.body.querySelectorAll('ul li');
			for(var i=0; i < lists.length; i++) {
				if(lists[i].innerHTML == "<input type= 'checkbox'>") {
				lists[i].parentElement.removeChild(lists[i]);
				};
			};
		});
	};

	
	list.appendChild(checkbox);







// <input type="text" id="txtSearch" onkeydown="if (event.keyCode == 13) document.getElementById('btnSearch').click()"/>
// <input type="button" id="btnSearch" value="Search" onclick="doSomething();" />



// unshift/push - add an element to the beginning/end of an array
// TheArray.unshift(TheNewObject);
// or reverse the array
//  or .insertBefore



