var ul = document.querySelector("ul");


  var xhr = new XMLHttpRequest;
  xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true);
  xhr.send();

  xhr.addEventListener('load', function(e){
    var response = JSON.parse(xhr.response);
    for(var i=0;i<response.length;i++){
      if (response[i]["borough"] == "Brooklyn"){
        var li = document.createElement("li");
        li.innerText = response[i]["address"] + " -- " + response[i]["park_site_name"];
        ul.appendChild(li);
      }

    }

    console.log(e);

  }
)
