$(function(){
  var $theItemInput = $("input#grocery_item");
  var $button = $("section.add button"); 
  assembleList(); 
  $button.on('click', function() {
    var item = $theItemInput.val(); 
    createItem(item); 
    addItemToList(item); 
  });   
});

function addItemToList(itemStr) {
  var $theGroceryList = $("ul"); 
  var $listItem = $("<li></li>"); 
  $listItem.text(itemStr);
  $theGroceryList.append($listItem); 
}

function createItem(itemStr) {
    var params = {"item": itemStr}; 
    $.post("/items", params);
}

function assembleList() {
  $.getJSON("/items", null, function(itemsArray) {
    if (itemsArray.length != 0)
      addAllItems(itemsArray); 
  });
}

function addAllItems(arr) {
  $.each(arr, function(idx, item) {
    addItemToList(item["item"]); 
  });
}