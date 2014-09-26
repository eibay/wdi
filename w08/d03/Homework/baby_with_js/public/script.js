$(document).ready(function() {
  var babyTable = $("table");
  var request = new XMLHttpRequest();
  // didn't about how to communicate to the server 
  // what year we were getting so get it from present document 
  var secondHeader = $("header h2"); 
  var headerText = secondHeader.text(); 
  var year = headerText.split(' ')[3].replace('!', ''); 
  // have a route set up on the server giving JSON array of babies
  // gets the year param from the url 
  var jsonRequestUrl = "http://localhost:4567/json/";
  var requestParams = {"year": year}; 
  $.getJSON(jsonRequestUrl, requestParams, function(babies) {
    $.each(babies, function(b, baby) {
      var babyRow = createBabyRow(baby); 
      babyTable.append(babyRow); 
    });
  });
});

function createBabyRow(baby) {
  // hard-coded array in order of th 
  // how to find attr & assign them to 
  // corresponding th dynamically? 
  var attrs = ["name", "county", "gender", "count"]; 
  var babyRow = $("<tr></tr>");
  $.each(attrs, function(a, attr) {
    var data = $("<td></td>"); 
    data.text(baby[attr]); 
    babyRow.append(data); 
  }); 
  return babyRow; 
}