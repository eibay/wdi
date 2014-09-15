var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
  var path = request["url"]
  var firstAfterSlash = path.split('/')[1]
  console.log(path)

  var findCompanyByName = function
  
  if(path == "/"){
  	companies_in_json = JSON.stringify(companies);
  } else if (path == "/" + firstAfterSlash){

  }
	} 

	response.end(companies_in_json);

	}	
});

server.listen(2000);

