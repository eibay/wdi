var companies = [
    {name: "apple", location: "cupertino"},
    {name: "google", location: "mountain view"}
];

// var findCompanyByName = function(name, arrayOfHashes) {
// 	arrayOfHashes.forEach(function(company) {
// 		if(company["name"] == name) {
// 			return company
// 		}
// 	})

// }

var findCompanyByName = function(name, arrayOfHashes) {
	for(i=0; i<arrayOfHashes.length; i++) {
		if(arrayOfHashes[i]["name"] == name) {
			return arrayOfHashes[i]
		}
	}
}

var a = findCompanyByName("apple", companies)

console.log(a)