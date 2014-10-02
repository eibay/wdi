getItems();



var ItemView = Backbone.View.extend({
  tagName: 'li',

  // events: {
  //   "click checkbox":"strike"
  // },
  //
  // strike: function(){
  //   console.log('make css strike');
  // }


  initialize: function(itemObj){
    this.item = itemObj.item;
    this.quantity = itemObj.quantity;
    this.strike = itemObj.strike;
  },

  render: function(){
    var innards = $("<div class='gItem'"+"<p>" + this.item + " " + "["+ " " + this.quantity + " " + "]" + " " + "</p>"+"<input type='checkbox' id='check'>" + " " + "<button class='del'><img src='/trashcan.gif' /></button>"+"</div>");
    this.$el.html(innards);
  }
})

var groceryItem = document.querySelector('#input_item');
var groceryNum = document.querySelector('#input_Num');

$('#add').click(
  function(){
    $.post('/items', {item: groceryItem.value, quantity: groceryNum.value, strike: false}, function(data){
    data = JSON.parse(data)
    view.render()
    $('#the_list').append(view.$el)
    })
  });

function getItems(){
  $.get('/allItems', function(items){
    var groceries = JSON.parse(items)
    for(i=0;i<groceries.length;i++){
      var view = new ItemView({
        id: groceries[i].id,
        item: groceries[i].item,
        quantity: groceries[i].quantity,
        strike: groceries[i].strike
      });

      view.render();
      $('#the_list').append(view.$el);
    }
  })
}
