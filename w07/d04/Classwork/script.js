var xhr = new XMLHttpRequest;

xhr.open("Get", 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true); //prepares request
xhr.send(); //sends request

var array = []
var ul = document.querySelector('ul')

xhr.addEventListener('load', function(e) {
	console.log(xhr.response)
	console.log(e)
	
	array = JSON.parse(xhr.response)

	for(i=0; i<array.length; i++) {

		if(array[i]["borough"]=="Brooklyn"){
			var li = document.createElement('li')
			li.innerText = array[i]["address"]
			ul.appendChild(li)
		}
	}
})





// - Part 1
//  - Update your current XMLHttpRequest code to hit the new route
//  - Console.log the return value.
//  - Answer the below questions:
//    - What data type is the return in? string
//    - Can you manipulate the return using index values?

// - Part 2
//   - Add an empty `ul` element to your html
//   - Iterate through the return value of the XMLHttpRequest and add each `address` as a new `li` within your `ul`

