$(function(){

  var $theGroceryList = $("ul"); 
  var $theItemInput = $("input#grocery_item");
  var $button = $("section.add button"); 
  $button.on('click', function() {
    var item = $theItemInput.val(); 
    var params = {"item": item}; 
    console.log(item); 
    $.post("/items", params, function(response) {
      console.log(response); 
    }); 
  });   
});