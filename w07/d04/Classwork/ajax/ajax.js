// var xhr = new XMLHttpRequest
// xhr.open('GET', 'http://www.omdbapi.com/?t=True%20Grit',true);
// xhr.send()

// console.log(xhr.response)
// //wont work!!  because asynchron
// //have to do event listener with

// xhr.addEventListener('load', function(e){
//   console.log(xhr.response)
//   console.log(e)
//   //also has an event
//   //tell it how many characters it is so that is how event
//   //listener knows how much it is waiting for
// })

var xhr = new XMLHttpRequest
xhr.open('GET', 'http://data.cityofnewyork.us/resource/sxx4-xhzg.json', true)
xhr.send()

xhr.addEventListener('load', function(e){
  add()
})



function add(){
  var where = document.getElementById("list")
  var list = JSON.parse(xhr.response)
  for(i = 0; i < list.length; i++){
    if (list[i].borough=="Brooklyn"){
    var listitem = document.createElement("li")
    listitem.innerText = list[i].address 
    // listitem.innerHTML = "<h3>" + list[i].address + "</h3>"
    where.appendChild(listitem)
  }
  }
}




