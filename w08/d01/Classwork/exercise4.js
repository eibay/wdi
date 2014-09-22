// 4. The basic structure of a request to an api in node is:
// ```javascript
// request(url, function (error, response, body) {
//      //code goes here
// });
// ```
// Imagine an api endpoint at ```www.dummyapi.com/cats``` that returns an array of cat names, like ```['fluffy', 'snickers', 'hairball']``` in JSON.
//   - write a request to this api that prints to the terminal the number of cat names returned.
//   - NOTE: to parse JSON in javascript we can use the method ```JSON.parse```


url = "www.dummyapi.com/cats"
request(url, function (error, response, body) {
	var json = JSON.parse(body)
	var cats = json.results
	console.log(cats.length)	

});
