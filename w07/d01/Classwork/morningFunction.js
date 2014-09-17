var array = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

function findCompany(array, company) {
	for (var i = 0; i < array.length; i++) {

		if(array[i]["name"] == company){
			var companyFound = array[i];
		}
	}
	return companyFound;
}

console.log(findCompany(array, company));