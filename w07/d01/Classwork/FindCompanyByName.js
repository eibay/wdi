


var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];
  

  var findCompanyByName = function(companyName){
  	i = 0
  	companies2 = []
  	while (i< companies.length){
  		if (companies[i]["name"] == companyName){
  			companies.push(companyName)
  		} i++
  	} return companies2
  };



function findByName(name) {
  	for(var i=0; i<companies.length; i++){
  			if (companies[i].name == name){
  					return companies[i];
  			}
  	}
  	return {};
}

  var the company = findByName('banana')