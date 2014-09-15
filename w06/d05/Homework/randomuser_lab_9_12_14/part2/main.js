var http = require('http');

var heathers = [
  {first_name: "Veronica", last_name: "Sawyer", user_id: "1", grade: "Senior", quote: "What is your damage, Heather?"},
  {first_name: "Martha", last_name: "Dumptruck", user_id: "2", grade: "Freshman", quote: "I'd like that."},
  {first_name: "Betty", last_name: "Finn", user_id: "3", grade: "Junior", quote: "Nice guys finish last, I should know."},
  {first_name: "J.D.", last_name: "Dean", user_id: "4", grade: "Dropout", quote: "Chaos is what killed the dinosaurs, darling."},
  {first_name: "Heather", last_name: "Chandler", user_id: "5", grade: "Sophomore", quote: "Did you have a brain tumor for breakfast?"}]

var randoms = []

var server = http.createServer(function(request, response){
  console.log("Connection from client has been made")

var path = request["url"];  

  console.log("Client is attempting to reach the " + path + " route")

if (path == "/") {
	heathers_in_json = JSON.stringify(heathers);
  response.end(heathers_in_json);

} else if (path.split("/")[1] == "users") {
  response.end(heathers.length["first_name"]);

} else if (path.split("/")[1] == "user") {
    if (path == "/user/create") {
    var random_character =  
    {first_name: heathers[Math.floor(Math.random() * heathers.length)]["first_name"], 
    last_name: heathers[Math.floor(Math.random() * heathers.length)]["last_name"], 
    user_id: Math.floor(Math.random() * (heathers.length) + 10),
    grade: heathers[Math.floor(Math.random() * heathers.length)]["grade"], 
    quote: heathers[Math.floor(Math.random() * heathers.length)]["quote"]}
    randoms.push(random_character);
    new_random = JSON.stringify(random_character);
    response.end(new_random);

} else if (path.split("/")[1] == "user" && path.split("/")[2] != "create") {
    for (var i = 0; i < randoms.length; i++) {
    if (path == "/user/" + randoms[i]["user_id"]) {
      character = JSON.stringify(randoms[i]);
      response.end(character);
    }
  }
};

}});


server.listen(2000);