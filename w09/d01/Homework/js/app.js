function getMovie(){
  var span = $('span')
  var my_movie = span.text();
  $.get('http://www.omdbapi.com/?t='+my_movie, function(my_movie){
    var m = JSON.parse(my_movie);
    $('body').append('<h1>'+m['Title']+'</h1>')
    $('body').append('<p>'+'Year: '+m['Year']+' '+'| '+' '+'Rated: '+m['Rated']+' | '+'Genre: '+m['Genre'])
    $('body').append('<img src='+m['Poster']+' />')
  })
}

$(function(){
  var AppRouter = Backbone.Router.extend({
    routes: {
      "" : "index",
      "movies" : "movies",
      "books" : "books",
      ":width/:height":"skullz"
    }
  });

  var router = new AppRouter;

  router.on('route:index', function(){
    console.log('bruhaha');

  })

  router.on('route:movies', function(){
    $('body').append('<span id="matrix"><a href="#/The%20Matrix">The Matrix</a></span>');
    $('#matrix').click(getMovie);

  })

  // router.on('route:skullz', function(width, height){
  //   $('head').append.addHeader("Access-Control-Allow-Origin", "http://placeskull.com");
  //   $.get('http://placeskull.com/'+width+'/'+height, function(img){
  //     console.log(img);
  //     $('body').append('<img src='+img+' />');
  //   })
  // })

  router.on('route:books', function(){
    console.log('i like books.');
  })

// this.routes[Backbone.history.fragment]

  Backbone.history.start();
});
