var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];


function findByName(name){
  var answer = []
  companies.forEach(function(company){
    if (company.name == name){
      answer.push(company)
    }
    
  })
  return answer;
};

console.log(findByName("aadasdas"))

