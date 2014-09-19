

  var input = document.querySelector("input");
  var submit = document.querySelector("button");


      function queryPic(query){
        submit.addEventListener("click", function(){

        var xhr = new XMLHttpRequest();
        xhr.addEventListener('load', function(){
          console.log(query);
        });

        xhr.open('GET', '/query=' + encodeURIComponent(query));
        console.log(encodeURIComponent(query));
        debugger;
        xhr.send();
        debugger;
      });

    }
