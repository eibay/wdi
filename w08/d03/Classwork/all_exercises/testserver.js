var http = require('http');
var fs = require('fs');

var server = http.createServer(function(req, res){
  var path = req['url'];
  var names = ["nastassia, nas, nasty, alex, nana, stassia"];
  var names_json = JSON.stringify(names);
  if (path == "/marquee"){
    res.end('<html><body><h1><marquee>Hello World</marqee></h1></body></h1></br />' + names_json)
  } else if (path == '/hello'){
    res.end('<style>h1{color:red}</style><h1>Hello World</h1><br /><pre>' + names_json + '</pre>');
  } else if (path == '/yo'){
    res.end('<h1>Yo World</h1><br />' + console.log('Nastassia'))
  } else if (path == '/testing'){
    res.end(fs.readFileSync('./index.html'));
  }

});

server.listen(2000);
