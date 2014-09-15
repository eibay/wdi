var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

function findCompanyByName(company){
		companies.forEach(function(comp){
			debugger;
			if(comp["name"]==company){

				company_hash=comp

			}

		});

	return JSON.stringify(company_hash);
}


console.log(findCompanyByName("apple"))
