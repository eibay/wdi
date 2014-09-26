$(document).ready(function() {
  var babyTable = $("table");
  var request = new XMLHttpRequest();
  // didn't about how to communicate to the server 
  // what year we were getting so get it from present document 
  var secondHeader = document.querySelector("header h2"); 
  var headerText = secondHeader.innerText; 
  var year = headerText.split(' ')[3].replace('!', ''); 
  // have a route set up on the server giving JSON array of babies
  // gets the year param from the url 
  var requestURL = "http://localhost:4567/json/" + year;  
  request.open('GET', requestURL, true);
  request.send(null);
  request.addEventListener('load', function() {
    var babies = JSON.parse(request.response);
    for (var b = 0; b < babies.length; b++) {
      var baby = babies[b];
      var babyRow = createBabyRow(baby); 
      babyTable.append(babyRow); 
    }
  });
});

function createBabyRow(baby) {
  // hard-coded array in order of th 
  // how to find attr & assign them to 
  // corresponding th dynamically? 
  var attrs = ["name", "county", "gender", "count"]; 
  var babyRow = document.createElement("tr"); 
  for (var a = 0; a < attrs.length; a++) {
    var attr = attrs[a];
    var data = document.createElement("td"); 
    data.innerText = baby[attr]; 
    babyRow.appendChild(data); 
  }
  return babyRow; 
}