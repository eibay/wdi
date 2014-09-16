window.onload = function(){

  var box = document.getElementById("input");
  var buttons = document.getElementById("buttons");
  var submit = document.getElementById("submit");
  var del = document.getElementById("del");
  var button = document.querySelectorAll("button");
  // var delete = document.getElementById("del");

  submit.addEventListener("click", function(){
    var ul = document.getElementById("list");
    var input = box.value;
      if(input != "") {
        var list = document.createElement("li");
        list.innerText = input;
        box.value = "";
        ul.appendChild(list);
      }
    })

  del.addEventListener("click", function(){
    var ul = document.getElementById("list");
    var input = box.value;
    if(input != ""){
      var list = document.getElementById("list");

      for(var i=0;i<list.children.length;i++){
        if (input == list.children[i].innerText){
        list.children[i].parentElement.removeChild(list.children[i]);
        }
      }
      box.value = "";
    }
  })




}
