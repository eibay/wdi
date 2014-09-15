var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

//catch what your method returns.
//console log it on the outside.

function findByName(name) {
	for(var i=0; i<companies.length; i++){
	
	if (companies[i].name == name) {
		return companies[i]; 
    }
  }
  return {};
}

var thecompany = findByName('apple');


console.log("apple = " + findByName('apple'));
console.log("google = " + findByName('apple'));
console.log("banana = " + findByName('banana'));


//console.log(thecompany);



