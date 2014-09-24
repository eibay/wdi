var http = require('http');
var fs = require('fs');

var server = http.createServer(function (req, res) {
	var names=['conor', 'steven', 'jon', 'paul', 'drake'];
	var coolDudes={conor:'blue', steven:'green', john:'mauve'}
	function returnJson(names){

		return JSON.stringify(names)
	}

	function returnJSONHash(hash){

		return JSON.stringify(hash)

	}	

	if(req.url=="/names"){

		res.end(returnJson(names));
	}
	else if(req.url=="/attributes"){


	res.end(returnJSONHash(coolDudes))
	}

	res.end('go away')



});


	server.listen(3000);