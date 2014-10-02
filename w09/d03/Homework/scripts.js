
function showPicture(pic, first){
   // debugger
  var unorderedList = document.querySelector("ul");
  var listItem = document.createElement("li");
  // var img = document.querySelector("img");

  var img = document.createElement("img");
  var pTag = document.createElement("p");
  pTag.innerText=first
  // img.src = picture;
  img.setAttribute('src', pic)
 
  listItem.appendChild(pTag);
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
            // debugger
      var picture = response.results[0].user.picture.large;
      var name = response.results[0].user.name.first;
      // for (var i = 0; i < picture.length; i++){

      showPicture(picture, name);
      // }
    });

    xhr.send();
  });



});





