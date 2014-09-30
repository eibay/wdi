$(function(){
  var $theItemInput = $("input#grocery_item");
  var $button = $("section.add button"); 
  assembleList(); 
  $button.click('click', function() {
    var item = $theItemInput.val(); 
    createItem(item); 
    addItemToList(item); 
  });   
});

function addItemToList(itemStr, id) {
  var $theGroceryList = $("ul"); 
  var $listItem = $("<li></li>"); 
  $listItem.attr("id", id);

  var $itemContent = $("<p></p>");

  $itemContent.text(itemStr); 
  $listItem.append($itemContent);

  var $deleteButton = $("<button></button>");
  $deleteButton.text('X'); 
  $deleteButton.click(function(e) {
    var listItemId = e.currentTarget.parentNode.id;
    console.log("You clicked a delete button!");
    destroyItem(listItemId);  
  });
  
  $listItem.append($deleteButton); 
  $theGroceryList.append($listItem); 
}

function destroyItem(id) {
  $.ajax({
    url: "/items",
    type: "DELETE",
    data: {"id": id},  
    success: function(response) {
      console.log(response);
    }
  });
}

function removeItemFromList() {

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
    addItemToList(item["item"], item["id"]); 
  });
}