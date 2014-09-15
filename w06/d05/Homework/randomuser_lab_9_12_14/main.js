var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){

    var path = request["url"];
    var dynamic_name = path.split("/")[2]

    //dynamic_name is set to the name of the company passed after name/
    // so ex of dynamic_name in http://127.0.0.1:2000/name/apple would be apple

  if (path == "/") {

    // The key part here is JSON.stringify(companies) which turns the array of hashes into a string. This string is then spit back out to the browser just as we would with a string of html in response.end(companies_in_json).


    // Example : [{"name":"apple","location":"cupertino"},{"name":"google","location":"mountain view"}]

	companies_in_json = JSON.stringify(companies);
	response.end(companies_in_json);

} else if (path == "/name/" + dynamic_name) {

  // if path is name and one of the names of the company from our hash
    companies.forEach(function(company) {

      // then iterate through the hash and use the word company due to semantics as an argument

      if (company["name"] == dynamic_name) {

        // if the name of the company matches the dynamic_name

        response.end(JSON.stringify(company));

      // then turn the array of hashes for that company and its attributes into a string and spit it out to the browser

      }

    });


} else {

  response.end("<h1> Error </h1>");
}

});

server.listen(2000);
