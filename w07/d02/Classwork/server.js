var http = require('http')
var fs = require('fs')

var server = http.createServer(function(request, response) {
	var path = request["url"]
	if(path=="/") {
		var html = fs.readFileSync("./tree.html")
		response.end(html)
	}
})

server.listen(2000)

var birch = document.querySelector("ul.sapling li")

var removeElement = function(element) {
element.parentElement.removeChild(element);
}

birch.addEventListener('click', function(event) {
  removeElement(event.target);
});


document.querySelectorAll('li')
var lis = document.querySelectorAll('li')

for(var i=0; i<lis.length; i++) {
  lis[i].addEventListener('click', function(event) {
    removeElement(event.target)
  })
}