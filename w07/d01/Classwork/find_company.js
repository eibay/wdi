var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
	];

function findCo(company) {
	companies.forEach(function(record) {
		if(record["name"] == company) {
			found = record;
		}
	})
	return found;
}

console.log(findCo("apple"));