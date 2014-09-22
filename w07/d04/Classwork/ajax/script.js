xhr = new XMLHttpRequest;

xhr.open("GET", "http://data.cityofnewyork.us/resource/sxx4-xhzg.json", true);
xhr.send();

xhr.addEventListener("load", generateList);

function generateList(feed) {
	var arr = JSON.parse(feed.target.response)
	var list = document.querySelector("#list");
	arr.forEach(function(obj){
		var item = document.createElement("li");
		item.innerText = obj.address + ", " + obj.borough;
		if (obj.borough == "Brooklyn") {
			list.appendChild(item);
		}
	});
}