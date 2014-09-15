var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

function findCompanyByName(company){
	var company_hash;
	companies.forEach(function(comp){
		if(comp.name===company){
			 company_hash=comp;
			}else{
				company_hash={};
			}
	});
	return company_hash;
}
console.log(findCompanyByName("apple"))
