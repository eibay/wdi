var http = require('http');
var Router = require('node-simple-router');

var router = Router()

router.get('/names', function(request, response){
	var names = returnNames()
	response.end(names)
});

router.get('/people',function(request,response){
	var people= returnPeople()
	response.end(people)
});

var server=http.createServer(router);
server.listen(2000)



function returnPeople(){
	var people=[
		{name: 'yoyo', age: '25', color: 'green'},
		{name: 'jet', age: '35', color: 'purple'},
		{name: 'mer', age: '28', color: 'brown' }
	];

	var jsonHash= JSON.stringify(people)
	return jsonHash.toString()
}


function returnNames(){
	var names= ['yoyo', 'jet', 'mer']
	var parsed = JSON.stringify(names)
	var parsedString = parsed.toString()
	return parsedString
};