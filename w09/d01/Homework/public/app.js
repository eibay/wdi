$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
      "movies": "movies",
      "books": "books", 
      "hello/:name": "helloer"
    }
  });

  var router = new AppRouter(); 

  // route to say hello 
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

  router.on("route:movies", function() {
    var movies = [
      "His Girl Friday", 
      "What Happened Was...", 
      "Pontypool"
    ];

    var requestArray = []; 
    for (var i = 0; i < movies.length; i++) {

      var apiUrl = "http://www.omdbapi.com/";
      var queryParams = "?t=" + encodeURIComponent(movies[i]); 
      var apiQueryUrl = apiUrl + queryParams; 
      

      var request = new XMLHttpRequest(); 
      requestArray.push(request);

      requestArray[i].open("GET", apiQueryUrl, true); 
      requestArray[i].send(null); 
      requestArray[i].addEventListener('load', function(e) {
        var movie = JSON.parse(e.currentTarget.response); 
        addMovie(movie.Title, movie.Year, movie.Poster);
      });
    }
  }); 

  Backbone.history.start();

});

function capitalize(str) {
  return str[0].toUpperCase() + str.slice(1); 
}

function addMovie(title, year, poster) {
  var main = document.querySelector("main");
  var div = document.createElement("div"); 
  var posterImg = document.createElement("img");
  posterImg.src = poster; 
  div.appendChild(posterImg); 
  var titleHeader = document.createElement("h3");
  titleHeader.innerText = title + " (" + year + ')'; 
  div.appendChild(titleHeader); 
  main.appendChild(div); 
}