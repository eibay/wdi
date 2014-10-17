 var MovieView = Backbone.View.extend({
  initialize: function(){
      console.log("A new Index view has been created!");
      this.render();
  },
  render: function(){
    $('ul').append(this);
  }
 });

 var BookView = Backbone.View.extend({
  initialize: function(){
    console.log("A new Create view has been made");
    this.render();
  },
  render: function(){
    this.$el.html("<h2>Ohayooo</h2>") 
  }
 });

$(function(){

  var AppRouter = Backbone.Router.extend({
    routes: {
      "": "index",
      "movies": "movies",
      "books": "books",
      "hello/:name": "hello",
      ":width/:height": "placekitten"
    }
  });

  var router = new AppRouter;

  router.on('route:index', function(){
    console.log("Welcome to our page!");
    // var header = $('header');
    // header.html('<h2>Hello to main page!</h2>');
    // var header = $('header');
    // var createView = new CreateView({el: header});
  });

  ////////Movies page////////

  router.on('route:movies', function(){

    $('.list').remove();
    $('.movie_detail').remove();

    console.log("Welcome to a movies page!");
    var movies = [
      "Inception",
      "Holiday",
      "Love Actually"
    ];

    for(var i=0;i<movies.length;i++) {

      var movie_encoded = encodeURI(movies[i]);
      var li = document.createElement('li');
      var a = document.createElement('a');

      $(a).attr('href', '#/movies/' + movie_encoded);
      $(a).text(movies[i]);

      $(li).attr('class', 'list')
      $(li).append(a);

      $('ul').append(li);
    };

    $('.list').click(function(){

      $('.movie_detail').remove();
      var movie_encoded = this.childNodes[0].href.split('/');
      movie_encoded = movie_encoded[movie_encoded.length-1];

      console.log('Clicked!')

      $.ajax({url: "http://omdbapi.com/?t=" + movie_encoded, type: "GET", success: function(data){

        console.log("Success!");

        // var movie_page = [];

        // var title = JSON.parse(data).Title;
        // var year = JSON.parse(data).Year;
        // var poster = JSON.parse(data).Poster;

        // movie_page[0] = "Title: " + title;
        // movie_page[1] = "Year: " + year;
        // movie_page[2] = "Poster: " + poster;

        // $('.list').remove();

        // for(var i=0;i<movie_page.length;i++) {

        //   var li = document.createElement('li')
        //   $(li).text(movie_page[i]);
        // debugger
        //   $('ul').append(li);
        // };

        $('.list').remove();

        var movie_page = {
          Title: JSON.parse(data).Title,
          Year: JSON.parse(data).Year,
          Poster: JSON.parse(data).Poster
        };

        var li = document.createElement('li');
        $(li).attr('class', 'movie_detail')
        $(li).text(movie_page.Title);
        $('ul').append(li);

        var li = document.createElement('li');
        $(li).attr('class', 'movie_detail')
        $(li).text(movie_page.Year);
        $('ul').append(li);

        var li = document.createElement('li');
        var img = document.createElement('img');
        $(li).attr('class', 'movie_detail')

        $(img).attr('src', movie_page.Poster)
        $(li).append(img);
        $('ul').append(li);
        
      }});

    });
  });

  ///////////////////////////

  ////////Books page/////////

  router.on('route:books', function(){

    $('.list').remove();
    $('.movie_detail').remove();

    var books = [
      "Gone Girl",
      "Killing Patton",
      "The Blood of Olympus"
    ];
  });

  ///////////////////////////

  ////////Hello page/////////

  router.on('route:hello', function(name){
    console.log("Welcome to a books page!")

    $('.list').remove();
    $('.movie_detail').remove();
      var name = name;

      var h1 = document.createElement('h1');
      $(h1).attr('class', 'list')
      $(h1).text("Hello " + name);

      $('body').append(h1);

  });

  ///////////////////////////

  ////////Placekitten////////

  router.on('route:placekitten', function(width, height){
  console.log("Welcome to a placekitten page!")

  $('.list').remove();
  $('.movie_detail').remove();
  var width = width;
  var height = height;

  var img = document.createElement('img');
  $(img).attr('class', 'list');
  $(img).attr('src', 'http://placekitten.com/g/' + width + '/' + height);

  $('body').append(img);

  });


  Backbone.history.start();

});