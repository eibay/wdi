window.addEventListener('load', function() {
  var babyTable = document.querySelector("table");
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
      var babyRow = document.createElement("tr"); 

      var babyNameData = document.createElement("td")
      babyNameData.innerText = baby["name"];
      babyRow.appendChild(babyNameData); 

      var babyCountyData = document.createElement("td"); 
      babyCountyData.innerText = baby["county"];
      babyRow.appendChild(babyCountyData);

      var babyGenderData = document.createElement("td"); 
      babyGenderData.innerText = baby["gender"];
      babyRow.appendChild(babyGenderData); 

      var babyCountData = document.createElement("td"); 
      babyCountData.innerText = baby["count"]; 
      babyRow.appendChild(babyCountData);

      babyTable.appendChild(babyRow);
    }
  });
});