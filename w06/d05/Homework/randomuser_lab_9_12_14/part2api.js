var http = require('http');

var names = ["Tejal","Sonny", "Toral", "Tracy"]
var jobs = ["student", "lawyer", "doctor", "finance"]
var random = []

var server = http.createServer(function(request, response){
var path = request["url"]


if (path.split("/")[1] == "user" && path.split("/")[2] == "create") {
  indexName = Math.floor(Math.random() * names.length)
  indexJob = Math.floor(Math.random() * jobs.length)
  var randomperson = {name: names[indexName], job: jobs[indexJob], id: random.length+1} 
  random.push(randomperson)
  randomstring = JSON.stringify(randomperson)
  response.end(randomstring);
} else if (path.split("/")[1] == "user" && path.split("/")[2] != "create"){
    var id = path.split("/")[2]
    random.forEach(function(user){
      if (user["id"] == path.split("/")[2]) {
         userjson = JSON.stringify(user)
        response.end(userjson)
        }
      })
} else if (path.split("?")[0] == "/users" && path.split("?").length == 2){
  var onpage = []
  var pagelength = path.split("?")[1].split("&")[0].split("=")[1]
  var pagenumber = path.split("?")[1].split("&")[1].split("=")[1]
  var lastuser = pagelength * pagenumber
  var firstuser = (lastuser - pagelength) + 1
  var indexfirstuser = firstuser - 1
  var indexlastuser = lastuser - 1

// index is always -1
//have to include that somehow
  var i = indexfirstuser
  while (indexlastuser >= i){
    onpage.push(random[i])
    i++
  }
  var pagejson = JSON.stringify(onpage)
  response.end(pagejson)


 }
})

server.listen(2000);