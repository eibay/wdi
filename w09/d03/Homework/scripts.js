window.addEventListener('load', function() {
  var button = document.querySelector('button');
  button.addEventListener('click', function(){
    var xhr = new XMLHttpRequest;

    xhr.open('GET', 'http://api.randomuser.me/', true);
    xhr.send();
    xhr.addEventListener('load', function(){
      var response = JSON.parse(xhr.response)
      var picture = response.results[0].user.picture;
      for (var i = 0; i < picture.length; i++){
              showPicture(picture[i]);
      }
    });
  });

function showPicture(picture){
   debugger
  var unorderedList = document.querySelector("ul");
  var listItem = document.createElement("li");
  listItem.innerText = picture;
  unorderedList.appendChild(listItem);
};

});





