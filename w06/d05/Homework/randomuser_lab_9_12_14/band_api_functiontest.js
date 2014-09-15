


	var path = '/users?page_length=5&page_num=3';

// **** query params to get page length and which page
// GET /users?page_length=5&page_num=3
// rewriting the old ruby parse_url method
function parseURL(path) {
	var queryString = path.split('?')[1];
	console.log(queryString);
	// 'page_length=5&page_num=3'

	var pairs = queryString.split('&');
	console.log(pairs);
	// [ 'page_length=5', 'page_num=3' ]
	
	var keyValues = [];

	for (var i = 0; i < pairs; i++) {
		keyValues.push(pairs[i].split('='))
	}
	// nothing is getting pushed in keyValues array, although it works in repl
	console.log(keyValues);
}

console.log(parseURL(path));
