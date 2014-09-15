var http = require ('http');


var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];


var server = http.createServer(function(request, response){
var path = request["url"]
	if (path == "/"){
		companies_in_json = JSON.stringify(companies);
		response.end(companies_in_json);
	} else if ((path.charAt(0) == "/") && (path.length > 1)) {
		var names = path.split("/")[1]
		companies.forEach(function(comp){
			if (comp.name == names){
				console.log(names)
				console.log(comp.name)
				var company_name = JSON.stringify(comp);
				console.log(company_name)
				return company_name;
			} response.end("company_name");
		}) 
	}
})
server.listen(2000);


// browser will not display company_name variable. If i move response.end 1 line lower (which is where I think it sould be), it says unexpected identifier "response" if I add a ; before response I get  company_name undefined. if i put response.end("company_name") i actually get "company_name" in the browser... so I'm not sure why the JSON.stringify'ed text isn't coming though in the browser




