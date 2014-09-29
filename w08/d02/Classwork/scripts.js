 var xhr = new XMLHttpRequest;

 xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);


 xhr.addEventListener('load', function(e) {
 	arr = JSON.parse(xhr.response);
 	makelist(arr)
 });

 xhr.send();

 function makelist(arr) {
  var stuffUl = document.getElementById("list");
  for (var i = 0; i < arr.length; i++) {
    var thingLi = document.createElement("li");
    thingLi.innerText = arr[i]["address"];
    stuffUl.appendChild(thingLi);
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