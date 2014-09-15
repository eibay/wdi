
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