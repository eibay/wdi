var button = document.querySelector('button');
var input = document.querySelector('input');
var items = document.querySelector('ul.groceries');

button.addEventListener('click', function() {
  createItem(input.value);
  input.value = "";
});

function createItem(name) {
  var item = {name: name}

  $.ajax({
    url: "/items", 
    data: item,
    type: "POST"
  }).done(function(itemComplete) {
    item.id = itemComplete.id;
  });

  addItem(item);
}

function addItem(item) {
  var itemLi = document.createElement('li');
  itemLi.innerText = item.name;

  var removeButton = document.createElement('button');
  removeButton.innerText = "x";
  removeButton.addEventListener('click', function(e) {
    removeItem(item, itemLi);
  });
  itemLi.appendChild(removeButton);

  items.appendChild(itemLi);
}

function removeItem(item, li) {
  $.ajax({
    url: "/items/" + item.id,
    type: "DELETE"
  });

  li.remove();
}

$.ajax({
  url: "/items",
  type: "GET"
}).done(function(items) {
  items.forEach(function(item) {
    addItem(item);
  });
});
