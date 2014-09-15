var http = require('http');

//Returning JSON from your server 
//instead of HTML involves using the JSON.stringify method.

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

/*The key part here is JSON.stringify(companies) 
which turns the array of hashes into a string. 
This string is then spit back out to the browser 
just as we would with a string of html in response.end
(companies_in_json).
*/

//send the individual company names to it's own page. 
//for each name, send to name page

//

var server = http.createServer(function(request, response){
  companies_in_json = JSON.stringify(companies);
  response.end(companies_in_json);

  	var path = request.params.filepath;

	 if (path == '/'){
		var html = fs.readFileSync('./index.html')
		response.end(html);
	} else if (path == '/'){
		var html = fs.readFileSync('./apple.html')
	    while (i < array.length){
		jsonString.push('<li>' + array[i] + '</li>');
		i++;
		var html = taggedString.join();
		html = html.replace("/,/g,");
		array = ("<html><body><ul>" + html + "</ul></body></html>");
		console.log(array)
		response.end(html);
	} else if (path == "styles.css"){
	      response.end(css);
	} else {
	      response.end("<h1>ERROR</h1>");
	    };
});

server.listen(2000);





	