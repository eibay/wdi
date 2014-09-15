
var https = require("https");
    url = "https://api.instagram.com/v1/tags/smile/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061";


var request = https.get(url, function (response) {
 
    var buffer = "", 
        data,
        route;

    response.on("data", function (chunk) {
        buffer += chunk;
    }); 

    response.on("end", function (err) {
 
        
        data = JSON.parse(buffer);
        console.log(data["data"][0])
    }); 
}); 