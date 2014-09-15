var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

function findCompanyByName(CompanyName){
	for(var i=0; i<companies.length; i++){
		if (CompanyName == companies[i]['name']){
			return companies[i];
		}
	}
}

console.log(findCompanyByName("google"));