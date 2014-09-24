var http= require('http');
var fs=require('fs');

var server = http.createServer(function(request, response){

	var path= request["url"]
	console.log(path)

	if(path == '/hello'){
		var parsedString = returnJSON()
		response.end("<h1 style='color: red'>Hello world<h1>" + parsedString)
	
	}else if(path =='/marquee'){
		var parsedString = returnJSON()
		response.end(fs.readFileSync('./marquee.html') + parsedString)
	
	}else if(path =='/yo'){
		var parsedString = returnJSON()
		response.end('yo world' + parsedString)
	
	}else if (path =='/names'){
		var parsedString = returnJSON()
		response.end(parsedString)

	}else if (path =='/people'){
		var array = returnArray();
		response.end(array)
	}else{
		response.end('hello world')
	};
	

});

server.listen(2000)

function returnArray(){
	var people=[
		{name: 'yoyo', age: '25', color: 'green'},
		{name: 'jet', age: '35', color: 'purple'},
		{name: 'mer', age: '28', color: 'brown' }
	];

	var jsonHash= JSON.stringify(people)
	return jsonHash.toString()
}


function returnJSON(){
	var names= ['yoyo', 'jet', 'mer']
	var parsed = JSON.stringify(names)
	var parsedString = parsed.toString()
	return parsedString
};