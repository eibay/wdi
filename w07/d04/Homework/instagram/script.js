window.onload = function(){

var http = require('http');
var httpClient = require('request');
var url = require('url');

var button = document.getElementsByTagName('button');

// can i call getPhotos here as the second argument instead of anonymous function? 
button.addEventListener("click", function() {

	var tagname_input = document.getElementById("tagname_input");
	var tagname = tagname_input.value;

	function getPhotos(tagname) {

	}


});

// i think there should be a function here with the argument that is the tagname_input that i can use to call ruby and ask for photos when the button listener triggers
function getPhotos(tagname) {
   // from afternoon homework requests from ruby url  
   // oh, right, but i nover understood it so i can't really use it
    httpClient.get('http://localhost:4567/' + 

      encodeURIComponent(tagname), function(err, res2, body) {
      response.end(body);

}





};