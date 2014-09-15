var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];


var firstAfterSlash = "google"

function find(company, array){
  array.forEach(function(comp){
    if (comp["name"] == company){
      return company
    }
  })
};

console.log(find(firstAfterSlash, companies))
