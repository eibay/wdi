var http = require('http');
var Router = require('node-simple-router');
var router = Router();

var server = http.createServer(router);
	router.get("/names", function(req, res){
	res.setHeader('Content-Type','application/json');
  res.setHeader('Access-Control-Allow-Origin', '*');


	res.end(returnJson(facts));
	});
	router.get("/attributes", function(req, res){
		res.end(returnJSONHash(coolDudes));
	});
	server.listen(2000);

var names=['conor', 'steven', 'jon', 'paul', 'drake'];

var facts=[{name:'conor', favColor: 'blue', age:'26'}, {name:'paul', favColor: 'orange', age: '99',}, {name:'steven', favColor: 'green', age:'0'}]


	var coolDudes={conor:'blue', steven:'green', john:'mauve'}
	function returnJson(names){

		return JSON.stringify(names)
	}

	function returnJSONHash(hash){

		return JSON.stringify(hash)

	}	