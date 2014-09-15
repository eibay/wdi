var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

// function findCompanyByName(firstAfterSlash) {

// 	companies.forEach(function(thing) {
// 		if (thing.name == firstAfterSlash) {
// 			return thing;
// 		};
// 	});
// };

// var thecompany = findCompanyByName('apple');

// console.log(thecompany);

function findByName(name) {
	for(var i=0;i<companies.length;i++) {
		if (companies[i].name == name) {
			return companies[i];
		}
	}

	return {};
};

console.log("apple = ");
console.log(findByName("apple"));