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
    var babies = request.response;
  });
});