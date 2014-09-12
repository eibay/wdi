var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var path = '/google';
var query = path.split("/")[1];
var result = [];

var companies_in_json = JSON.stringify(companies);
// var result = JSON.stringify(result);

function matchStuff(companies, query){
  for(var i=0;i<companies.length;i++){
    if (companies[i]['name'] == query){
       result.push(companies[i]);
       console.log(result);
    }
  }
};

matchStuff(companies, query);
