window.onload = function(){
var xhr = new XMLHttpRequest

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
xhr.send();
xhr.addEventListener("load", function(){


var res = JSON.parse(xhr.response)
console.log(res)


var address = function(){
	var ul = document.getElementById("list")
	for (i=0; i<res.length; i++){
		var li = document.createElement("li")
		if (res[i]["borough"] == "Brooklyn"){
		li.innerText = res[i]["address"]
		ul.appendChild(li)
		}
	}
}
address()
});

}