var xhr = new XMLHttpRequest

xhr.open("PUT", "/book/3", true)
xhr.addEventListener("load", function() {console.log(arguments)})
var data = JSON.stringify({borrowed: false, borrower_id: null})

xhr.send(data)

var xhr = new XMLHttpRequest

xhr.open("DELETE", "/book/3", true)
xhr.addEventListener("load", function() {console.log(arguments)})
var data = JSON.stringify({borrowed: false, borrower_id: null})

xhr.send()

var xhr = new XMLHttpRequest

xhr.open("POST", "/borrower", true)
xhr.addEventListener("load", function() {console.log(arguments)})
var data = JSON.stringify({name: "Pete Gronegan"})

xhr.send(data)

var xhr = new XMLHttpRequest

xhr.open("POST", "/book", true)
xhr.addEventListener("load", function() {console.log(arguments)})
var data = JSON.stringify({title: "The Lion, the Witch and the Wardrobe", borrowed: false})

xhr.send(data)

var xhr = new XMLHttpRequest

xhr.open("PUT", "/book/5", true)
xhr.addEventListener("load", function() {console.log(arguments)})
var data = JSON.stringify({title: "The Lion, the Witch and the Wardrobe", borrowed: true, borrower_id: 1})

xhr.send(data)