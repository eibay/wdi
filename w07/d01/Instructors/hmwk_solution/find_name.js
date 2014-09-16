var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

function findByName(name) {
	for(var i=0; i<companies.length; i++) {
		if (companies[i].name == name) {
			return companies[i];
		}
	}

	return {};
}

console.log("apple = ")
console.log(findByName('apple'));

console.log("google = ");
console.log(findByName('google'));

console.log("banana = ");
console.log(findByName('banana'));