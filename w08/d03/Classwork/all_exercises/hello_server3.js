var http = require('http');

var server = http.createServer(function(req, res){
  function makeNames(){
    var coolNames = ['Balthazar', 'Edgar', 'Ebenezer', 'Bartholomew', 'Gabriella', 'Rosalinda', 'Darius', 'Dante', 'Mildred', 'Agatha', 'Lucinda'];
    coolNames_json = JSON.stringify(coolNames);
    return coolNames_json
  }

  var path = req['url'];
  var names = ["nastassia, nas, nasty, alex, nana, stassia"];
  var names_json = JSON.stringify(names);
  if (path == "/marquee"){
    res.end('<html><body><h1><marquee>Hello World</marqee></h1></body></h1></br />' + JSON.stringify(makeNames())
  } else if (path == '/hello'){
    res.end('<style>h1{color:red}</style><h1>Hello World</h1><br /><pre>' + makeNames() + '</pre>');
  } else if (path == '/yo'){
    res.end('<h1>Yo World</h1><br />' + makeNames())
  }

});

server.listen(2000);
