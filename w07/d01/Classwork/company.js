var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var companyName = "apple"

function findCompanyByName (company) {
	 companies.forEach(function(company) {
    if (company["name"] == companyName) {
      return (companyName)
  } 
  })
  };

console.log(findCompanyByName(companyName));