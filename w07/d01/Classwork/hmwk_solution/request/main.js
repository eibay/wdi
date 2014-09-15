var request = require('request');
request('http://127.0.0.1:2000/user/create', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body) // Print the google web page.
  }
})
// saying if no erros !error and response == 200 that means
//the code is 200 which means normal then print body

// same as require in ruby!!!
//kind of like httparty but for node

// request({
//       uri: "http://127.0.0.1:3000/user/create",
//       method: "POST",
//       }, function(error, response, body) {
//         var user=JSON.parse(body);


//         res.redirect("/user/"+user.id)
//     });

// to give ur a method and json analysis
//OR
// request.post('url')

//request method is asynchronise only responds after it gets 
//information so will run stuff before and after it until it gets
//a response

// ruby does it in order