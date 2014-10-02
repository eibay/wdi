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


function constructListItemContents(itemStr, quanityStr, isCompleted) {
  $listItemContents = $("<div></div>");

  // have a paragraph naming the list item 
  var $itemName = $("<p></p>");
  $itemName.text(itemStr); 
  $itemName.css("text-decoration", 
    isCompleted ? "line-through" : "none"); 
  $listItemContents.append($itemName);

  // construct a delete button 
  var $deleteButton = $("<button></button>");
  $deleteButton.addClass("delete"); 
  $deleteButton.text('X'); 
  $listItemContents.append($deleteButton);

  // construct a completed checkbox 
  var $completedCheckbox = $("<input></input>");
  $completedCheckbox.attr("type", "checkbox");
  $completedCheckbox.attr("checked", isCompleted);
  $listItemContents.append($completedCheckbox);

  // construct a quanity input 
  var $quanityInput = $("<input></input>");
  $quanityInput.attr("type", "number");
  $quanityInput.attr("min", 1);
  $quanityInput.val(quanityStr);
  $listItemContents.append($quanityInput);

  return $listItemContents;  
}

var ItemView = Backbone.View.extend({

  tagName: "li", 

  events: {
    "click button.delete": 'destroyItem',
    "change input[type=checkbox]": 'toggleCompleted', 
    "change input[type=number]": 'updateQuantity' 
  },

  updateQuantity: function(e) {
    var newQuanity = e.currentTarget.value;
    console.log(newQuanity); 
    var id = e.currentTarget.parentNode.parentNode.id;
    console.log(e.currentTarget.parentNode.parentNode);
    console.log(id)
    $.ajax({
      url: "/items", 
      type: "PUT", 
      data: {"id": id, "quanity": newQuanity}
    });
  }, 

  toggleCompleted: function(e) {
    var listItemId = e.currentTarget.parentNode.parentNode.id;
    var completed = e.currentTarget.checked;

    // toggle the line-through 
    if (completed) {
      e.currentTarget.parentNode.parentNode.style.textDecoration = "line-through";
    } else {
      e.currentTarget.parentNode.parentNode.style.textDecoration = "none";
    } 

    // update obj on server 
    $.ajax({
      url: "/items",
      type: "PUT",
      data: {"id": e.currentTarget.parentNode.parentNode.id, "completed": completed}
    });
  }, 

  destroyItem: function(e) {
    var id = e.currentTarget.parentNode.parentNode.id;  
    $.ajax({
      url: "/items",
      type: "DELETE",
      data: {"id": id}
    });
    removeItemFromList(id);
  }, 

  initialize: function(itemObj) {
    this.quanityStr = itemObj.quanity;
    this.itemStr = itemObj.item; 
    this.isCompleted = itemObj.completed;
    this.id = itemObj.id;
  },

  render: function() {
    var itemListItemContents = constructListItemContents(
      this.itemStr, 
      this.quanityStr, 
      this.isCompleted);
    // this will be set automatically: 
    // this.$el.attr("id", this.id);
    this.$el.html(itemListItemContents);
  }
}); 


function removeItemFromList(id) {
  var idStr = '#' + id;
  var $listItem = $(idStr);
  $listItem.remove();
}

function createItem(itemStr, quanityStr) {
  var params = {"item": itemStr, "quanity": quanityStr}; 
  $.post("/items", params, function(response){
    var listItemView = new ItemView(response);
    listItemView.render(); 
    $("ul").append(listItemView.$el);
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
    var listItemView = new ItemView(item);
    listItemView.render();
    $("ul").append(listItemView.$el);
  });
}

