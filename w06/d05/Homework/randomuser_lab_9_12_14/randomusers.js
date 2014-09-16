var http = require('http');

var characters = [
	{name: "Ted Mosby", id: "1"},
	{name: "Peter Griffin", id: "2"},
	{name: "Corey Matthews", id: "3"},
	{name: "Homer Simpson", id: "4"}
	]
var show = ["How I Met Your Mother", "Family Guy", "Boy Meets World", "The Simpsons"]
var character_and_show = []

var server = http.createServer(function(request, response){
	characters_in_json = JSON.stringify(characters);

var path = request['url'];
var method = request['method'];
var dynamic_path = path.split("/")[2];

	
if ((path =="/user/create") && (method="POST")) {	

var people = []
var characters = ["Ted Mosby", "Peter Griffin", "Corey Matthews", "Homer Simpson"]

function createPerson () {

	person = {}
	person.characters = randomElement(characters);
	person.id = people.length +1 ;

	people.push(person);

	return person
	}

function randomElement(arr) {
	var index = Math.floor(Math.random() * arr.length);
	return arr[index];

	}

// http://localhost:2000/user/1
else if (path =="/user/" + dynamic_path) {
	characters.forEach(function(character) {
		if(character["id"] == dynamic_path) {
			response.end(JSON.stringify(character))
			}
		})
	}

// GET /users?page_length=5&page_num=3
else if(path=="/users") { 
		response.end(JSON.stringify(characters))
	}

else if (path.split("?")[0] == "/users" && path.split("?").length == 2){
  	var page_length = path.split("?")[1].split("&")[0].split("=")[1]
  	var page_number = path.split("?")[1].split("&")[1].split("=")[1]
	var view_page = []
  	
		for(i = page_length * page_number - page_length - 1; i< page_length * page_number; i++) 
		{
			view_page.push(character_and_show[i])
		}
			response.end(JSON.stringify(view_page))
		}
})
server.listen(2000);
