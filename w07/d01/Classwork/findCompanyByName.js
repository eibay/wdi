
var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];
array = []
var findCompanyByName = function(compName){
	i=0 
	while (i<companies.length){
		if (compName == companies[i]["name"]){
			array.push(companies[i])
		}i++
	} return array
}

console.log(findCompanyByName("apple"))



function findByName(name){
	for var i=0; i<companies.length; i++){
		if (companies[i]["name"] == name){
			console.log("GOT IT!")
		}
	}return {};
}