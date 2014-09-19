// window.onload=function(){
	
var xhr = new XMLHttpRequest

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
xhr.send();

xhr.addEventListener('load', function(e){
	
	var data = JSON.parse(xhr.response);
	var ul= document.querySelector("ul");

	for(var i = 0; i < data.length; i++){
		if(data[i].borough == 'Brooklyn'){
			var liItem= document.createElement("li");
			liItem.innerText = data[i].address + " - " + data[i].borough;
			ul.appendChild(liItem);
		};
	};

});

// };
