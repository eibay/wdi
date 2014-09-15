


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