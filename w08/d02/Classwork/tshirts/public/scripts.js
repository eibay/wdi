window.onload = function(){  

modalButtons()

function attaching(parent){
   var quanity = document.createElement("input")
    parent.appendChild(quanity)
    quanity.placeholder = "quanity"
    quanity.id="howMany"
    var email = document.createElement("input")
    parent.appendChild(email)
    email.id="email"
    email.placeholder = "email"
    var enter = document.createElement("button")
    parent.appendChild(enter)
    enter.className='buying'
    enter.innerText="ENTER"
    buyButtons()
}

function modalButtons(){
  var button = document.getElementsByClassName("buy")
  for(i=0; i < button.length; i++){
  button[i].addEventListener("click", function(){
    var parent = event.target.parentNode
    attaching(parent)
   
  })
}
}

function buyButtons(){
var buyButton = document.getElementsByClassName('buying')
for(i=0; i < buyButton.length; i++){
  buyButton[i].addEventListener("click", function(){
    var id = event.target.parentNode.children[4].value
    var email = event.target.parentNode.children[8].value
    var number = event.target.parentNode.children[7].value
    ajaxCall(id,email,number)
    var h1 = document.createElement("h1")
    event.target.parentNode.appendChild(h1)
    h1.innerText = "Thank you for your purchase"
    clear()

  })
}
}

function ajaxCall(id, email, number){
  var xhr = new XMLHttpRequest();
  xhr.open('POST', "/tshirt/"+ id + "/" + number +"/" +email);
  xhr.send()
 }

function clear(){
  email = document.getElementById("email")
  email.value =""
  quanity = document.getElementById("howMany")
  quanity.value=""
  setTimeout('document.getElementById("close").click()', 3000)
}

}
