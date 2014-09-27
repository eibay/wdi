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
  var genderDropdown = document.querySelector("select.gender");
  var countyDropdown = document.querySelector("select.county"); 

  genderDropdown.addEventListener('change', function(e) {
    var gender = e.srcElement.value;
    var babyRows = document.querySelectorAll("table tr");

    for (var r = 1; r < babyRows.length; r++) 
      babyRows[r].parentNode.removeChild(babyRows[r]); 
    
    $.getJSON(jsonRequestUrl, requestParams, function(babies) {

      $.each(babies, function(b, baby) {

        if (baby["gender"] == gender)
          babyTable.append(createBabyRow(baby)); 

      }); 
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