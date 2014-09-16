var http = require('http');

var people = [
  {name: "sean", location: "cupertino"},
  {name: "neel", location: "mountain view"}
];

var server = http.createServer(function(request, response){
  var path = request["url"]
  console.log(path)

  var msg = ""

  if (path == "/user/create") {
    var person = createPerson();

    console.log("people now equals...")
    console.log(people)
    msg = JSON.stringify(person)
  } 
	response.end(msg);	
});

server.listen(2000);


function createPerson(){
    //create a person with random attributes
    //add that person to the people array
    //return that person
}
function findByName(name) {
  	for(var i=0; i<companies.length; i++){
  			if (companies[i].name == name){
  					return companies[i];
  			}
  	}
  	return {};
}