$(document).ready(function() {
  adjustBabyTable(); 

  var $dropDowns = $("select.gender, select.county"); 

  $dropDowns.change(function() {
    adjustBabyTable();  
  });
});

function adjustBabyTable() {
  destroyAllBabyRows(); 

  // AJAX variables 
  var year = $(location).attr("pathname").replace("/years/", '');
  var jsonRequestUrl = "http://localhost:4567/json/";
  var requestParams = {"year": year}; 
  
  $.getJSON(jsonRequestUrl, requestParams, function(babies) {

    // DOM variables
    var $genderDropdown = $("select.gender");
    var $countyDropdown = $("select.county");
    var $babyTable = $("table");

    // what genders & counties we want to see   
    var gender = $genderDropdown.val(); 
    var genderIsBlank = gender == '-';

    var county = $countyDropdown.val();  
    var countyIsBlank = county == '-';  

    $.each(babies, function(b, baby) {

      // test baby & then... 
      var babyHasThisGender = baby["gender"] == gender; 
      var babyHasThisCounty = baby["county"] == county;  
 
      // only add baby if needed    
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

