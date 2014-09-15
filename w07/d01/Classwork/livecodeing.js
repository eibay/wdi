var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
  var msg = "";
  var path = request["url"]
  var firstAfterSlash = path.split('/')[1]
  console.log(path)

  
  if (path == "/"){
  	companies_in_json = JSON.stringify(companies);
  	msg = companies_in_json
  } else if (path == "/" + firstAfterSlash){
  	msg = JSON.stringify(findByName(firstAfterSlash));
  } else if (path == "/user/create")
  	msg = JSON.stringify(createPerson());

	response.end(msg);	
});

server.listen(2000);

function findByName(name) {
  	for(var i=0; i<companies.length; i++){
  			if (companies[i].name == name){
  					return companies[i];
  			}
  	}
  	return {};
}

newPersonHash = {}
function createPerson(){
		var name = ["lisa", "grayson", "jeff"]
		var location = ["orange county", "miami", "orlando"]
    //create a person with random attributes
    //add that person to the people array
    //return that person
    for(var i=0; i<name.length; i++){
    	newPersonHash["name"]= name[Math.floor(Math.random()*name.length)]
    	newPersonHash["location"]= location[Math.floor(Math.random()*location.length)]
    }return newPersonHash
	};

	console.log(createPerson());
