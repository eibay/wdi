var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

function findCompanyByName(companyName){
	for(var i = 0; i < companies.length; i++) {
		if(companies[i].name == companyName) {
			return companies[i];
		}
	}
}