var xhr = new XMLHttpRequest;
xhr.open('GET', './public/ny-baby-names.json', true)
xhr.send();

xhr.addEventListener('load', function() {
	console.log('testing');

// display contents 
function babyRow(baby)
	var baby_attributes = ["name", "county", "gender", "count"];
	var babies = document.querySelector("tr");

	for (var i = 0; i < baby_attributes.length; i++);
		var attribute = baby_attributes[i];
		var data = document.createElement("td");

		data.innerText= baby[attribute];
		babies.appendChild(data);
	}
return babyRow(baby_attributes);

});