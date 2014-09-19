var xhr = new XMLHttpRequest

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);

xhr.addEventListener('load', function(e) {
	var parsedResponse = JSON.parse(xhr.response);
	var ul = document.querySelector("ul");
 
 	for(var i = 0; i < parsedResponse.length; i++){
 		var address = parsedResponse[i]["address"];
 		var li = document.createElement("li");
 		li.innerText = address;
 		ul.appendChild(li);
 }

});

xhr.send();

// console.log(xhr.response);
// console.log(JSON.parse(xhr.response));
// console.log(e);
// console.log(typeof(xhr.response));

// - Part 1
//  - Update your current XMLHttpRequest code to hit the new route
//  - Console.log the return value.
//  - Answer the below questions:
//    - What data type is the return in?
// JSON
//    - Can you manipulate the return using index values?

// - Part 2
//   - Add an empty `ul` element to your html
//   - Iterate through the return value of the XMLHttpRequest and add each `address` as a new `li` within your `ul`