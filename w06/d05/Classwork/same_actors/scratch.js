var http = require("http");

var generateArrayOfActors = function(title) {

    var url = "http://www.omdbapi.com/?t=" + encodeURI(title);
    var request = http.get(url, function (response) {

        var buffer = "", 
        data,
        route;

        response.on("data", function (chunk) {
            buffer += chunk;
            data = JSON.parse(buffer)
            console.log(data)
        }); 

    });

}