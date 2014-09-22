request('http://www.dummyapi.com/cats', function (error, response, body) {
    var json=JSON.parse(body);
    console.log(json.length);

});