// var xhr = new XMLHttpRequest

// xhr.open("PUT", "http://127.0.0.1:4567/category/22", true)
// xhr.addEventListener("load", function() {console.log(arguments)})
// var data = JSON.stringify({name: "Betrothal"})
// xhr.send(data)

var xhr = new XMLHttpRequest

xhr.open("DELETE", "http://127.0.0.1:4567/album/12", true)
xhr.addEventListener("load", function() {console.log(arguments)})
var data = JSON.stringify({name: "Betrothal"})
xhr.send()