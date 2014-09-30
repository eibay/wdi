$(function(){

  var $theGroceryList = $("ul"); 
  var $theItem = $("input#grocery_item");
  var $button = $("section.add button"); 
  $button.on('click', function() {
    console.log("You clicked the button!"); 
  });   
});