add()

function add(){
  //getting();

  $(".adding").click(function(){
    var item = event.target.parentNode.children[0].value
    var number = event.target.parentNode.children[1].value
    writing(item,number)
    event.target.parentNode.children[0].value=""
    event.target.parentNode.children[1].value = ""
  })
}


var ItemView = Backbone.View.extend({

  tagName: "li",

  events: {
    "click button.delete" : "destroy",
    "click button.edit" : "toggleEdit",
    "click button.update" : "update"
  },

  destroy: function() {
    this.model.destroy();

    // $.ajax({
    //   url: '/delete',
    //   data: { deleting: this.id } ,
    //   type: 'DELETE'
    // });
  },

  update: function() {
    this.model.set('number', this.$el.find('input[name="quantity"]').val());
    this.model.save();
    
    // $.ajax({
    //   url:'/edit',
    //   data: { editing: this.id, number: this.number },
    //   type: 'PUT'
    // });

    //this.render();
  },

  toggleEdit: function() {
    this.$el.find('.edit-fields').toggle();
  },

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy", this.remove);
  },

  render: function() {
    var innards = "<h4>" + this.model.get('item') + " " + this.model.get('number') + "</h4>" 
    innards += "<button class='delete'>DELETE</button> <button class='edit'>Edit</button>"
    innards += "<div style='display:none;' class='edit-fields'><input name='quantity' placeholder="+this.number+"><button class='update'>UPDATE</button></div>"
    this.$el.html(innards);

    if (this.number < 1) {
      this.$el.addClass("done");
    }
  }
});

var ItemModel = Backbone.Model.extend({
  urlRoot: "/items"
});

var ItemCollection = Backbone.Collection.extend({
  url: "/items",
  model: ItemModel
});

collection = new ItemCollection();

collection.fetch({ success: function() {
  collection.models.forEach(function(item) {
    var view = new ItemView({model: item});

    view.render();

    $(".list").append(view.el);  
  })
}});

// function getting(){
//   $.get("/gettingitems",function(items) {
//     var items = JSON.parse(items)

//     for (i=0; i < items.length; i++){

//       var item = new ItemModel({
//         id: items[i].id, 
//         item: items[i].item, 
//         number: items[i].number
//       });

//       var view = new ItemView({model: item});

//       view.render();

//       $(".list").append(view.el);
//     }
//   });
// }


function writing(item,number){
  var model = new ItemModel({item: item, number: number});

  model.save();

  var view = new ItemView({ model: model });
  view.render();
  $(".list").append(view.el);

  // $.post("/add", {item: item, number:number}, function(data){
  //   data = JSON.parse(data)

  //   var view = new ItemView({ id: data, number: number, item: item });
  //   view.render();
  //   $(".list").append(view.el);
  // })
}


// function deleting(){
//   $(".delete").click(function(){
//   var deleteItem = event.target.parentNode
//   var serverDelete = deleteItem.className
//   deleteItem.remove()
// $.ajax({
//     url: '/delete',
//     data: {deleting: serverDelete},
//     type: 'DELETE',
//     success: function(result) {
//     }
//   })
// })
// }

// function done(number){
//   $(".done").click(function(){
//     $(event.target.parentNode).append()
//       $(".new").click(function(){
//           id = event.target.parentNode.id;
//           howMany = event.target.parentNode.children[3].value
//     $.ajax({
//       url:'/edit',
//       data: {editing: id, number: howMany},
//       type: 'PUT',
//       success: function(result){}
//     })
    
//     if (howMany < 1){
//       var remove = this.parentNode.children
//       items = remove[0].innerText.split(" ")
//       remove[0].innerText = items[0]

//       remove[4].parentNode.removeChild(remove[4])
//       remove[3].parentNode.removeChild(remove[3])
//       remove[2].parentNode.removeChild(remove[2])
//       $("."+id).css("text-decoration", "line-through");

//       } else if (howMany > 0){
        
//         items = event.target.parentNode.children[0].innerText.split(" ")
//         event.target.parentNode.children[0].innerText=items[0]+" " +howMany
//           this.parentNode.removeChild(this.parentNode.children[3])
//           this.parentNode.removeChild(this.parentNode.children[3])
//       }


//     })
    

//   })
// }