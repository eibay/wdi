 var xhr = new XMLHttpRequest;

 xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
 response = xhr.send();
 arr = json.parse(response);

 xhr.addEventlistener('load', function(e) {
 	console.log(typeof(xhr.response);
 	console.log(e);
 });

 function makelist(arr) {
  var stuffUl = document.getElementById("list");
  for (var i = 0; i < arr.length; i++) {
    var thingLi = document.createElement("li");
    thingLi.innerText = arr[i];
    stuffUl.appendChild(thing);
  }
}


//  function makelist(arr) {
//   var stuff = document.getElementById("list");
//   var hobbitUl = document.createElement("ul");
//   hobs.appendChild(hobbitUl);
//   for (var i = 0; i < arr.length; i++) {
//     var hobbitLi = document.createElement("li");
//     hobbitLi.className = "hobbit";
//     hobbitLi.innerText = hobbits[i];
//     hobbitUl.appendChild(hobbitLi);
//   }
// }