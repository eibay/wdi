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
  var jsonRequestUrl = "http://localhost:4567/json/" + year;
  $.getJSON(jsonRequestUrl, null, function(babies) {
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
  var babyRow = $("<tr></tr>"); 
  for (var a = 0; a < attrs.length; a++) {
    var attr = attrs[a];
    var data = $("<td></td>"); 
    data.text(baby[attr]); 
    babyRow.append(data); 
  }
  return babyRow; 
}