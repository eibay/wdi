var fs = require("fs")
var http = require ("http")


var server = http.createServer(function (req, res){
	console.log(req.url)
	if (req.url == "/"){
		var index = fs.readFileSync("./views/index.html")
		res.end(index)

	} else if (req.url =="/ajaxCall"){
		var babyNames = JSON.parse(fs.readFileSync("./public/ny-baby-names.json")).toString()
		res.end(babyNames)
	}
})

server.listen(2000)