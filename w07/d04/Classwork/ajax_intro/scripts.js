var xhr=new XMLHttpRequest;

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
xhr.send()
xhr.addEventListener('load', function(event){
	var json=JSON.parse(xhr.response)
	var ul=document.getElementById('list');
	json.forEach(function(thing){
	if(thing["address"] != undefined && thing["borough"]=="Brooklyn"){
		var li=document.createElement('li');
		li.innerText=thing["address"];
		ul.appendChild(li);
	}
})
});


