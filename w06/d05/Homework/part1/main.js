var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
  var path = request["url"];
  var query = path.split("/")[1];
  var result = [];

  function matchStuff(companies, query){
    for(var i=0;i<companies.length;i++){
      if (companies[i]['name'] == query){
         return result.push(companies[i]);
      }
    }
  };

  var companies_in_json = JSON.stringify(companies);


  if (path == "/"){
    debugger;
    response.end(companies_in_json);
  } else if (path == "/"+ query){
    debugger; 
    matchStuff(companies, query);
    result = JSON.stringify(result);
    response.end(result);
  } else {
    debugger;
    response.end("err.");
  }

});


server.listen(2000);
