var xhr = new XMLHttpRequest;

xhr.open('GET','http://www.omdbapi.com/?t=True%20Grit',true);
xhr.send();

xhr.addEventListener('load', function(event){
	console.log(event);
	console.log(xhr.response);
	for(var index=0; index<array.length; index++){ 
		var array = JSON.parse(xhr.response)
		var li= document.createElement("li");
		li.innerText = array[index]["address"];
		var ul = document.querySelector("ul")
		ul.appendChild(li)
	};
});
