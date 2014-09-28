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
  genderDropdown.addEventListener('change', function(e) {
    var gender = genderDropdown.value;
    destroyAllBabyRows() 
    $.getJSON(jsonRequestUrl, requestParams, function(babies) {
      $.each(babies, function(b, baby) {
        var genderIsBlank = gender == '-'; 
        var babyHasThisGender = baby["gender"] == gender; 
        var countyIsBlank = countyDropdown.value == '-';  
        var babyHasThisCounty = baby["county"] == countyDropdown.value; 
        if (genderIsBlank || babyHasThisGender)
          if (countyIsBlank || babyHasThisCounty)
            babyTable.append(createBabyRow(baby)); 

      }); 
    });    
  }); 

  var countyDropdown = document.querySelector("select.county"); 
  countyDropdown.addEventListener('change', function(e) {
    var county = countyDropdown.value; 
    destroyAllBabyRows() 
    $.getJSON(jsonRequestUrl, requestParams, function(babies) {
      $.each(babies, function(b, baby) {
        var countyIsBlank = county == '-';
        var babyHasThisCounty = baby["county"] == county; 
        var genderIsBlank = genderDropdown.value == '-'; 
        var babyHasThisGender = baby["gender"] == genderDropdown.value; 
        if (countyIsBlank || babyHasThisCounty) 
          if (genderIsBlank || babyHasThisGender)  
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

function destroyAllBabyRows() {
  var babyRows = document.querySelectorAll("table tr");

  for (var r = 1; r < babyRows.length; r++) 
    babyRows[r].parentNode.removeChild(babyRows[r]); 
}