
// - Check out this url in your browser
//   - http://data.cityofnewyork.us/resource/sxx4-xhzg.json

// - Part 1
//  - Update your current XMLHttpRequest code to hit the new route
//  - Console.log the return value.
//  - Answer the below questions:
//    - What data type is the return in?
//    - Can you manipulate the return using index values?

// - Part 2
//   - Add an empty `ul` element to your html
//   - Iterate through the return value of the XMLHttpRequest and add each `address` as a new `li` within your `ul`

// var xhr = new XMLHttpRequest;

// xhr.open('GET', 'http://www.omdbapi.com/?t=True%20Grit', true);

// xhr.send();

// xhr.addEventListener('load', function() {
//   console.log(xhr.response);

// });

var xhr = new XMLHttpRequest;

xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);

xhr.send(); // the event listener doesnt get fired off until after this request is done so we could even make this the last piece of code in the file and it will still run

var ul = document.querySelector("ul")


// load refers to the request loading
xhr.addEventListener('load', function() {

  var array = JSON.parse(xhr.response)
  for(i = 0; i < array.length; i++) {

    var li = document.createElement("li");

    li.innerText = array[i]["address"]

    ul.appendChild(li)

  }

});

