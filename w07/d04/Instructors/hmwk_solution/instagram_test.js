var request = require('request');

//don't take my client_id!!
var client_id = "cacf552d16c24fd6b86a67aa4afe2ef0";
//just hardcoding the lattitude and longitude for this test code
var lat = "37.3860517";
var lng = "-122.0838511";
var url = 'https://api.instagram.com/v1/media/search?lat=' + lat + '&lng=' + lng + '&client_id=' + client_id;

console.log(url)

request(url, function (error, response, body) {
  //body is a string of JSON so I need to convert
  //it into a javascript data structure
  var json = JSON.parse(body);
  //I dug into the data in the debugger and it looks like
  //everything is in an array at json.data
  //(note that "json" is just the variable name that I chose, 
  //I could have called it anything I wanted to)
  var imageArray = [];

  //loop through the json data and one by one add
  //an image url to our variable imageArray
  for(var i=0; i< json.data.length; i++) {
    var img_url = json.data[i].images.standard_resolution.url;
    imageArray.push(img_url);
  }

  //now imageArray is an array of urls, if we were on the server
  //we would convert this into JSON and send it back to the client
  //but just for this test code we are going to console.log it
  console.log(imageArray)
})

