// POST /user/create
// creates a new user and returns that users info in JSON
// takes no parameters.
// GET /user/user_id
// returns a single user's info given the user_id
// GET /users:
// returns a paginated list of users that have been created in the system
// Query Param: page_length: how many users to return per page
// Query Param: page_num: the page number we are currently on
// Example: GET /users?page_length=5&page_num=3 would return the 11th to 15th user in the system. This should return no users if there are less than 11 users in the system.

var http = require('http');

var heathers = [
  {name: "Veronica Sawyer", user_id: "1", age: "17", quote: "What is your damage, Heather?"},
  {name: "Martha Dumptruck", user_id: "2", age: "16", quote: "I'd like that."},
  {name: "Betty Finn", user_id: "3", age: "15", quote: "Nice guys finish last, I should know."},
  {name: "J.D. Dean", user_id: "4", age: "20", quote: "Chaos is what killed the dinosaurs, darling."},
  {name: "Heather Chandler", user_id: "5", age: "21", quote: "Did you have a brain tumor for breakfast?"}]

var server = http.createServer(function(request, response){
  console.log("Connection from client has been made")

var path = request["url"];  

  console.log("Client is attempting to reach the " + path + " route")

if (path == "/") {
	heathers_in_json = JSON.stringify(heathers);
  response.end(heathers_in_json);

// Creates path based on user_id
 // } else if (path.split("/").length > 1) {
 //  heathers.forEach(function(character){
 //    if (character["user_id"] == path.split("/")[2]){
 //      character = JSON.stringify(character)
 //      response.end(character);
 //    } 
 //  })

  } else if (path.split("/")[1] == "user") {

    if (path == "/user/create") {
  // var random = heathers[Math.floor(Math.random() * heathers.length)];
  var random_character =  [{name: heathers[Math.floor(Math.random() * heathers.length)]["name"], age: heathers[Math.floor(Math.random() * heathers.length)]["age"], quote: heathers[Math.floor(Math.random() * heathers.length)]["quote"]}]
  new_random = JSON.stringify(random_character);
  response.end(new_random);
  }

}});


server.listen(2000);