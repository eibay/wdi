var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];
var array = []
var comp = "apple"
companies.forEach(function(a){
 if (a.name == comp){
 	array.push(a)
 	return array
 }
})
console.log(array)