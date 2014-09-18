var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);		

xhr.addEventListener('load', function(e){
	console.log('Callback in event has been friend');
	var array = JSON.parse(xhr.response);
	
	for(var i=0;i<array.length;i++){
		var list = document.createElement('li');
		list.innerText = array[i].address;
		var borough = array[i].borough;
		
		if(borough == 'Brooklyn') {
			var lists = document.querySelector('ul');
			lists.appendChild(list);
		};
	};
});

xhr.send();

for(var i=0;i<10000;i++){
	console.log(i);
};

// - Check out this url in your browser
//   - http://data.cityofnewyork.us/resource/sxx4-xhzg.json

// - Part 1
//  - Update your current XMLHttpRequest code to hit the new route
//  - Console.log the return value.
//  - Answer the below questions:
//    - What data type is the return in?
		// String.
//    - Can you manipulate the return using index values?
		// JSON.parse(xhr.response);
// - Part 2
//   - Add an empty `ul` element to your html
//   - Iterate through the return value of the XMLHttpRequest and add each `address` as a new `li` within your `ul`


