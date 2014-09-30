$(function(){
  var $theItemInput = $("input#grocery_item");
  var $theQuanityInput = $("input#grocery_item_quantity");
  var $button = $("section.add button"); 
  assembleList(); 
  $button.click('click', function() {
    var item = $theItemInput.val(); 
    var quanity = $theQuanityInput.val();
    createItem(item, quanity);
  });   
});

function addItemToList(itemStr, quanityStr, id) {
  var $theGroceryList = $("ul"); 

  // represent the item 
  var $listItem = $("<li></li>"); 
  $listItem.attr("id", id);
  var $itemContent = $("<p></p>");
  $itemContent.text(itemStr); 
  $listItem.append($itemContent);

  // construct a delete button 
  var $deleteButton = $("<button></button>");
  $deleteButton.text('X'); 
  $deleteButton.click(function(e) {
    var listItemId = e.currentTarget.parentNode.id;
    destroyItem(listItemId); 
  });
  $listItem.append($deleteButton); 

  // construct a quanity input 
  var $quanityInput = $("<input></input>");
  $quanityInput.attr("type", "number");
  $quanityInput.attr("min", 1);
  $quanityInput.val(quanityStr);

  $quanityInput.change(function(e) {
    var newQuanity = e.currentTarget.value;
    console.log(newQuanity);

  });
  $listItem.append($quanityInput);

  $theGroceryList.append($listItem); 
}

function destroyItem(id) {
  $.ajax({
    url: "/items",
    type: "DELETE",
    data: {"id": id}  
  });
  removeItemFromList(id); 
}

function removeItemFromList(id) {
  var idStr = '#' + id;
  var $listItem = $(idStr);
  $listItem.remove();
}

function createItem(itemStr, quanityStr) {
  var params = {"item": itemStr, "quanity": quanityStr}; 
  $.post("/items", params, function(response){
    addItemToList(itemStr, quanityStr, response.id);   
  });
}

function assembleList() {
  $.getJSON("/items", null, function(itemsArray) {
    if (itemsArray.length != 0)
      addAllItems(itemsArray); 
  });
}

function addAllItems(arr) {
  $.each(arr, function(idx, item) {
    addItemToList(item["item"], item["quanity"], item["id"]); 
  });
}