
function showPicture(picture){
   debugger
  var unorderedList = document.querySelector("ul");
  var listItem = document.createElement("li");
  var img = document.createElement("img");
  img.attr('src', picture);
  listItem.appendChild(img);
  // listItem.innerText = picture;
  unorderedList.appendChild(listItem);
};

window.addEventListener('load', function() {

  var button = document.querySelector('button');
  button.addEventListener('click', function(){
    console.log("button clicked");
    var xhr = new XMLHttpRequest;

    xhr.open('GET', 'http://api.randomuser.me/', true);
 
    xhr.addEventListener('load', function(){
      var response = JSON.parse(xhr.response)
            debugger
      var picture = response.results[0].user.picture.large;

      // for (var i = 0; i < picture.length; i++){
      showPicture(picture);
      // }
    });

    xhr.send();
  });



});





