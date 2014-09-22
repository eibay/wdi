var inputField = document.querySelector('input');

inputField.addEventListener('keydown', function(event) {
  if (event.keyCode == 13) {
    var xhr = new XMLHttpRequest;

    xhr.open('GET', "/city?city=" + inputField.value , true);
    xhr.send();

    xhr.addEventListener('load', function(e) {
      var images = JSON.parse(xhr.response);

      var div = document.querySelector('div');
      div.innerHTML = "";

      for (var i = images.length - 1; i >= 0; i--) {
        var img = document.createElement('img');
        img.src = images[i];

        div.appendChild(img);
      };
    });
  }
})
