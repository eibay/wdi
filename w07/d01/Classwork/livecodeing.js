var http = require('http');

var people = [];

var server = http.createServer(function(request, response){
  var msg = "";
  var path = request["url"]
  var firstAfterSlash = path.split('/')[1]
  console.log(path)

  
  if (path == "/"){
  	peoples_in_json = JSON.stringify(people);
  	msg = people_in_json
  } else if (path == "/user/create")
  	msg = JSON.stringify(createPerson());
  } else if (path.split('/').length == 3){
  	var id = path.split('/')[2]
  	var person = personById(id);
  	msg= JSON.stringify(person)
  } else if (path.split('?')[0] == "/users"){
  	//var params = getParams(path)
  	var num = parseInt(params.page_num); //params.page_num
  	var length = parseInt(params.page_length); //params.page_length
  	var start = length*(num-1)

  	var list = people.slice(start, start +length)

  	msg = JSON.stringify(list);
  }

	response.end(msg);	
});

server.listen(2000);

function getParams(path){
	var qs = path.split('?')[1]
	var params = qs.split('&')

	var goodParams ={}
	params.forEach(function(param){
		var name = param.split('=')[0]
		var value = param.split('=')[1]
		goodParams[name] = value
	});
	return goodParams;
}



function personById(id) {
  	for(var i=0; i<people.length; i++){
  			if (people[i].name == name){
  					return people[i];
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
    	newPersonHash["id"] = people.length +1;
    	newPersonHash["name"]= name[Math.floor(Math.random()*name.length)]
    	newPersonHash["location"]= location[Math.floor(Math.random()*location.length)]
    	people.push(newPersonHash)
    }return newPersonHash
	};


	// in ruby
	// require 'httparty'
	// JSON.parse(HTTParty.post('http://127.0.0.1:2000/user/create'))

