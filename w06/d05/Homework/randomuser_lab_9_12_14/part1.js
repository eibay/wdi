var http = require('http');


var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];


var server = http.createServer(function(request, response){
  var path = request["url"]
  if (path == "/"){
    var companies_in_json = JSON.stringify(companies);
    response.end(companies_in_json);

  } else if (path.split("/").length  == 2) {
  companies.forEach(function(company){
    if (company["name"] == path.split("/")[1]){
      var company = JSON.stringify(company)
      response.end(company);
    } 
  })
   
 }});
  

server.listen(2000);
