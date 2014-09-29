window.addEventListener('load', function() {
  var theButton = document.querySelector('button');
  theButton.addEventListener('click', function() {
    var request = new XMLHttpRequest();
    request.open('GET', "https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json", true);
    request.send(null);
    request.addEventListener('load', function() {
      var apiResponseJSON = JSON.parse(request.response);
      var hotspotData = apiResponseJSON["data"]; 
      var topTenHotspots = hotspotData.slice(0,10);
      for (var hotspotIdx = 0; hotspotIdx < topTenHotspots.length; hotspotIdx++) {
        var hotspot = topTenHotspots[hotspotIdx]; 
        var hotspotName = hotspot[9]; 
        var hotspotAddr = hotspot[10]; 
        listHotspot(hotspotName, hotspotAddr);
      } 
    });
  });
  var zipcodeInput = document.querySelector('input');
  zipcodeInput.addEventListener('keyup', function() {
    var request = new XMLHttpRequest();
    request.open('GET', "https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json", true);
    request.send(null);
    request.addEventListener('load', function() {
      if (zipcodeInput.value.length == 5) {
        var apiResponseJSON = JSON.parse(request.response);
        var hotspotData = apiResponseJSON["data"];
        var numListed = 0;
        for (var j = 0, numListed = 0; j < hotspotData.length, numListed < 10; j++) {
          var hotspot = hotspotData[j];
          var hotspotZip = hotspot[15];
          var hotspotName = hotspot[9];
          var hotspotAddr = hotspot[10]; 
          if (hotspotZip == zipcodeInput.value) {
            listHotspot(hotspotName, hotspotAddr); 
            numListed = numListed + 1; 
          }
        } 
      }
    });
  }); 
});

function listHotspot(name, addr) {
  var unorderedList = document.querySelector("ul"); 
  var listItem = document.createElement("li");
  listItem.innerText = name + " @ " + addr;
  unorderedList.appendChild(listItem); 
}