var xhr = new XMLHttpRequest();
xhr.open("GET", "http://localhost:2000/names");

xhr.addEventListener('load', function(res) {
  var names = JSON.parse(xhr.responseText);
  names = reverseList(names);
  var ul = ulInMemory(names);
  document.body.appendChild(ul);
})

xhr.send();

function reverseList(oldarr) {
  var arr = []
  oldarr.forEach(function(name) {
    arr.unshift(name);
  })
  return arr;
}

function ulInMemory(names) {
  var ul = document.createElement("ul");
  names.forEach(function(name) {
    var li = document.createElement("li");
    li.innerText = name;
    ul.appendChild(li)
  })
  return ul;
}
