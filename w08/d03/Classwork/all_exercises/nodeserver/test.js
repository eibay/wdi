window.onload =function(){
  var xhr = new XMLHttpRequest;
  xhr.open('GET', '/names', true );
  xhr.send();
  xhr.addEventListener('load', function(e){
    console.log(xhr.response);
  });
}
