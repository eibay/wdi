window.onload = function(){

	var submit = document.body.children[1];
  var deleteButton = document.body.children[2];
  var input = document.getElementById("user-input");
  var ul = document.getElementById("input-list");

  submit.addEventListener("click", function(){
    var li=document.createElement("li");
    li.innerHTML= input.value;
    ul.appendChild(li);
    input.value = "";
  });

  deleteButton.addEventListener("click", function(){
    var text = input.value;
    for(var i= 0; i < ul.children.length; i++){
      if (ul.children[i].innerText == text){
        ul.children[i].parentNode.removeChild(ul.children[i]);
      };
    };
    input.value = "";
  });

};