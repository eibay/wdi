$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
      "movies": "movies",
      "books": "books", 
      "hello/:name": "helloer"
    }
  });

  var router = new AppRouter(); 

  router.on("route:helloer", function(name) {
    var name = capitalize(name);  
    var main = document.querySelector("main"); 
    var helloHeader = document.querySelector("main h3");
    var helloStr = "Hello, " + name + '!'; 
    if (helloHeader) {
      helloHeader.innerText = helloStr;
    } else {
      helloHeader = document.createElement("h3");
      helloHeader.innerText = helloStr;
      main.appendChild(helloHeader); 
    } 
  });

  Backbone.history.start();

});

function capitalize(str) {
  return str[0].toUpperCase() + str.slice(1); 
}