$(function(){
  var $theItemInput = $("input#grocery_item");
  var $button = $("section.add button"); 
  $button.on('click', function() {
    var item = $theItemInput.val(); 
    var params = {"item": item}; 
    $.post("/items", params, function(response) {
      console.log(response); 
    }); 
    addItemToList(item); 
  });   
});

function addItemToList(itemStr) {
  var $theGroceryList = $("ul"); 
  var $listItem = $("<li></li>"); 
  $listItem.text(itemStr);
  $theGroceryList.append($listItem); 
}