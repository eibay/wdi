$(document).ready(function() {
  var babyTable = $("table");
  // get year from the current location's path using jQuery 
  var year = $(location).attr("pathname").replace("/years/", '');
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