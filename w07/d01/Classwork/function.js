var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

function findCompanyByName(name) {
  for(var i = 0; i < companies.length; i++) {
  if (companies[i].name == name) {
      return companies[i];

      }

    }

    return {}; // Just used to return something bc that is what is expected.

}

console.log("apple = " + findCompanyByName('apple'));
