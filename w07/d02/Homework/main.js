window.onload = function(){

  var input = document.getElementById("input");
  var list = document.getElementById("list");
  var allTheBoxes = document.querySelectorAll("input#check");
  var list_el = document.querySelectorAll("ul#list li");


  function showValue(input){
    if (input != ""){
      var text = input.value;
      var listEl = document.createElement("li");
      listEl.innerText = text;
      listEl.insertAdjacentHTML('beforeend', '<input type="checkbox" id="check"></input>');
      var firstBorn = document.querySelector("ul#list li");
      if (list.children.length == 0){
        list.appendChild(listEl);
      } else {list.insertBefore(listEl, firstBorn);}

      input.value = "";
    }
  }


  var clickedEnter = function(e){
    var key = e.which || e.keyCode;
    if (key == 13){
      showValue(input)
    }
  }

  var deleteCheckBox = function(){
    var checkbox = document.getElementById("check")
    for(var i=0;list.children.length;i++){
    if (list.children[i].checked == true){ list.children[i].parentNode.removeChild(list.children[i])}
    }
}
  input.addEventListener("keypress", clickedEnter );

  if (list.children.length > 0){
    console.log("we have an item");
    // var checkbox = document.querySelectorAll("input#check");
    list.addEventListener("click", function(event){
      console.log(event);
    });

    checkbox.addEventListener("click", function(){
      listEl.list.removeChild(listEl);
    })
  }





}
