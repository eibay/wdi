var http = require('http');
var router = require('node-simple-router')();

router.get("/names", function(req, res) {
	res.end(JSON.stringify(names()))
})

router.get("/people", function(req, res) {
	res.end(JSON.stringify(people()))
})

var server = http.createServer(router)
server.listen(2000);

function people() {
	return [
		{
			name: "sean",
			age: 28
		},
		{
			name: "todd",
			age: 93
		}
	]
}

function names() {
	return ["sean", "todd"];
}
