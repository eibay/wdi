$(document).ready(function() {
  adjustBabyTable(); 

  var $dropDowns = $("select.gender, select.county"); 

  $dropDowns.change(function() {
    adjustBabyTable();  
  });
});

function adjustBabyTable() {

  // AJAX variables 
  var year = $(location).attr("pathname").replace("/years/", '');
  var jsonRequestUrl = "http://localhost:4567/json/";
  var requestParams = {"year": year}; 

  // DOM variables 
  var $babyTable = $("table");
  var $countyDropdown = $("select.county");
  var $genderDropdown = $("select.gender");
 

  destroyAllBabyRows(); 
  $.getJSON(jsonRequestUrl, requestParams, function(babies) {
    $.each(babies, function(b, baby) {
      // what kind of table are we building? 
   
      var gender = $genderDropdown.val(); 
      var genderIsBlank = gender == '-';
      var babyHasThisGender = baby["gender"] == gender; 

      var county = $countyDropdown.val(); 
      var countyIsBlank = county == '-'; 
      var babyHasThisCounty = baby["county"] == county;  

      // select from babies only needed babies  
      if (genderIsBlank || babyHasThisGender) 
        if (countyIsBlank || babyHasThisCounty) 
          $babyTable.append(createBabyRow(baby));  
    }); 
  }); 
}


function createBabyRow(baby) {
  // hard-coded array in order of th 
  // how to find attr & assign them to 
  // corresponding th dynamically? 
  var attrs = ["name", "county", "gender", "count"]; 
  var $babyRow = $("<tr></tr>");
  $.each(attrs, function(a, attr) {
    var $data = $("<td></td>"); 
    $data.text(baby[attr]); 
    $babyRow.append($data); 
  }); 
  return $babyRow; 
}

function destroyAllBabyRows() {
  var babyRows = document.querySelectorAll("table tr");

  for (var r = 1; r < babyRows.length; r++) 
    babyRows[r].parentNode.removeChild(babyRows[r]); 
}