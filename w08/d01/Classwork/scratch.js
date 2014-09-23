var http = require("http");

http.get("http://www.omdbapi.com/?t=True%20Grit&y=1969", function(response, req) {
	console.log(response);
}).on("error", function(err) {console.log(err)});


