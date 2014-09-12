var http = require('http');
var fs = require('fs');
var Client = require('node-rest-client').Client;
var friends=["Matt LeBlanc", "Courtney Cox", "Jennifer Aniston", "David Schwimmer", "Lisa Kudrow", "Matthew Perry"]

server=http.createServer(function (req, res) {


  res.writeHead(200, {'Content-Type': 'text/html'});
  if(req.url=="/"){
  	console.log('Server running at http://127.0.0.1:2000/');
  	res.end(fs.readFileSync('index.html'));
  	
}
else if(req.url=="/cast" && req.method=="GET"){
		var str="<html><head>	<link rel='stylesheet' type='text/css' href='./style.css'></head><body><ul>";
	for(var i=0; i < friends.length; i++){
		str=str+"<li>"+friends[i]+"</li>";
}
	str=str+"</ul></body></html>";
	res.end(str);
}

else if(req.url=="/cast/random"){

	 var rand=Math.floor(Math.random() * (friends.length));
	 rand_string="<html><head><link rel='stylesheet' type='text/css' href='./style.css'></head><body><h1>"+friends[rand]+"</h1></body></html>"
	 res.end(rand_string)
}

else if(req.url=="/helloform"){


		res.end(fs.readFileSync('helloform.html'));
}

else if(req.url.split("?")[0]=="/hello"){
	var str=req.url.split("=");
	output="<html><head><link rel='stylesheet' type='text/css' href='./style.css'></head><body><h1>Hello "+str[1]+"</h1></body></html>";
	res.end(output)
}

else if(req.url=="/cast/new"){

	res.end(fs.readFileSync('newcastmember.html'));


}

else if(req.url=="/cast"&& req.method=="POST"){
var body = "";
		
		req.on('data', function(chunk) {
			body += chunk;
		});

		req.on('end', function(){
			var name=body.split("=")[1];
			name=name.split("+");
			name=name.join(" ");
			friends.push(name);
			var str="<html><body><ul>";
			for(var i=0; i < friends.length; i++){
				str=str+"<li>"+friends[i]+"</li>";
		}
			str=str+"</ul></body></html>";
			res.end(str);



	
		});
}
else if(req.url.split("?")[0]=="/photos"){
		var tag=req.url.split("=")[1];

		
		var https = require("https");
    url = "https://api.instagram.com/v1/tags/"+tag+"/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061";


var request = https.get(url, function (response) {
 
    var buffer = "", 
        data,
        route;

    response.on("data", function (chunk) {
        buffer += chunk;
    }); 

    response.on("end", function (err) {
 
        
        data = JSON.parse(buffer);
        console.log(data["data"][0]["images"]["low_resolution"]["url"])

        var str="<html><body>"

        for(i=0; i < data["data"].length; i++){

        		str=str+"<img src='"+data["data"][i]["images"]["low_resolution"]["url"]+"'><br>"	

        	}

        	str=str+"</body></html>"
    		
    			res.end(str)


   }); 
}); 


}

else if(req.url=="/style.css"){

	res.end(fs.readFileSync('style.css'));


}





});


server.listen(2000);