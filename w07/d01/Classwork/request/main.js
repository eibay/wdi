var request = require('request');
request('http://www.google.com', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body) // Print the google web page.
  }
})

// Make sure ur node server is running in another terminal and then run the code below to make everything work and connect to your program from the homework.

// This code acts like httparty and our node api is acting like a database from the homework code.

// var request = require('request');
// request('http://localhost:2000/user/create', function (error, response, body) {
//   if (!error && response.statusCode == 200) {
//     console.log(body) // Print the code from our hw web.
//   }
// })