var http = require('http');

var people = [];

var server = http.createServer(function(request, response){
  var path = request['url'];
  console.log(path)

  var msg = "";

  if (path == "/user/create") {
  	var person = createPerson();
  	msg = JSON.stringify(person);
  } else if (path.split('/').length == 3) {
  	var id = path.split('/')[2];
  	var person = personById(id);
  	msg = JSON.stringify(person);
  } else if (path.split('?')[0] == "/users") {
  	var params = getParams(path);
  	var num = parseInt(params.page_num);
  	var length = parseInt(params.page_length);

  	var start = length*(num-1);
  	var list = people.slice(start, start+length); 

  	debugger;

  	msg = JSON.stringify(list);
  }

  response.end(msg);
});

server.listen(2000);




function getParams(path) {

	//path = /users?page_length=5&page_num=3
	var qs = path.split('?')[1]
	//qs = page_length=5&page_num=3
	var params = qs.split('&')
	//params = [ 'page_length=5', 'page_num=3' ]

	var goodParams = {}
	params.forEach(function(param) {
		var name = param.split('=')[0]
		var value = param.split('=')[1]
		goodParams[name] = value
	});

	//goodParams = { page_length: '5', page_num: '3' }
	return goodParams;
}

function createPerson() {
	//create a person with random attributes
	//add that person to the people array
	//return that person

	var hairs = ["white", "brown", "blonde", "red"];
	var vests = ["denim", "leather", "classic"];

	person = {}
	person.id = people.length + 1;
	person.hair = randomElement(hairs);
	person.vest = randomElement(vests);

	people.push(person);

	return person;
}

function randomElement(arr) {
	var index = parseInt(Math.random() * arr.length);
	return arr[index];
}

function personById(id) {
	for(var i=0; i<people.length; i++) {
		if (people[i].id == id) {
			return people[i];
		}
	}

	return {};
}




