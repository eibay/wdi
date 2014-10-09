// getItems();

add();
var groceryItem = document.querySelector('#input_item');
var groceryNum = document.querySelector('#input_Num');

var ItemView = Backbone.View.extend({
  tagName: 'li',

  template: _.template( $('#template').html()),

  events: {
    "click button#delete": "destroy"
  },

  destroy: function(){
    this.model.destroy();
  },

  update: function(){
    this.model.set('quantity', this.$el.find('input[name="quantity"]').val())
    this.model.save();
  },

  initialize: function(){
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy", this.remove);
    // this.item = itemObj.item;
    // this.quantity = itemObj.quantity;
    // this.strike = itemObj.strike;
  },

  render: function(){
    this.$el.html(this.template(this.model.attributes));
  }
});

var ItemModel = Backbone.Model.extend({
  urlRoot: "/allItems"
});


function add(){
$('#add').click(
  function(){
    addTheItem(groceryItem.value, groceryNum.value)
    // $.post('/items', {item: groceryItem.value, quantity: groceryNum.value, strike: false}, function(data){
    // data = JSON.parse(data)
    // view.render()
    // $('#the_list').append(view.$el)
    // })
  })
}

var ItemCollection = Backbone.Collection.extend({
  url: "/allItems",
  model: ItemModel
});

var collection = new ItemCollection();

collection.fetch({ success: function(){
  console.log('success.')
  collection.models.forEach(function(item){
    var view = new ItemView({model: item});
    view.render();

    $("#the_list").append(view.$el);
  })
}});

function addTheItem(item, quantity){
  var model = new ItemModel({item: item, quantity: quantity});
  model.save();
  var view = new ItemView({ model: model});
  view.render();
  $("#the_list").append(view.el);
}

// function getItems(){
//   $.get('/allItems', function(items){
//     var groceries = JSON.parse(items)
//     for(i=0;i<groceries.length;i++){
//       var view = new ItemView({
//         id: groceries[i].id,
//         item: groceries[i].item,
//         quantity: groceries[i].quantity,
//         strike: groceries[i].strike
//       });
//
//       view.render();
//       $('#the_list').append(view.$el);
//     }
//   })
// }
