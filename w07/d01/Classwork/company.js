var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

// var companyName = "apple"

// function findCompanyByName (company) {
// 	 companies.forEach(function(company) {
//     if (company["name"] == companyName) {
//       return (companyName)
  
function findByName(name) {
	for(var i=0; i < companies.length; i++) {
		if (companies[i].name == name) {
			return companies[i];
		}
	}
	return {};
}

var thecompany = findByName('apple');
console.log('thecompany');

//   } 
//   })
//   };

// console.log(findCompanyByName(companyName));