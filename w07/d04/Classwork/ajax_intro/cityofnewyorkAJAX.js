var xhr = new XMLHttpRequest

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
xhr.send();

xhr.addEventListener('load', function(event){
	console.log(event);
	console.log(xhr.response);
	var array = JSON.parse(xhr.response)
	for(var index=0; index<array.length; index++){ 
		var li= document.createElement("li");
		li.innerText = array[index]["address"];
		var ul = document.querySelector("ul");
		ul.appendChild(li);
	}

	for(var index=0; index<array.length; index++){ 
		var li= document.createElement("li");
		if (array[index]["borough"] == "Manhattan"){
			li.innerText = array[index]["address"];
			var div = document.querySelector("div");
			div.appendChild(li);
		}
	};
});