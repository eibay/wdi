var http = require('http');

var companies = [
	{name: "apple", location: "cupertino"},
	{name: "google", location: "mountain view"}
];

var server = http.createServer(function(req, res){
	


	if(req.url=="/"){

	var companies_in_json = JSON.stringify(companies);
	res.end(companies_in_json);
}
else if(req.url.split("/")[1]!=""){


	var company_name=req.url.split("/")[1]
	var company_hash=""
	debugger;
		companies.forEach(function(company){

			if(JSON.stringify(company).match(company_name)){

				company_hash=company

			}

		});

	company_json=JSON.stringify(company_hash);
	res.end(company_json)

}






});

server.listen(2000);
