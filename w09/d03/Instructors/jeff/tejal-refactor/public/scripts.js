add()

function add(){
  getting()
  $(".adding").click(function(){
  var item = event.target.parentNode.children[0].value
  var number = event.target.parentNode.children[1].value
  console.log(item)
  console.log(number)
  writing(item,number)
  event.target.parentNode.children[0].value=""
  event.target.parentNode.children[1].value = ""
  })
}

var ItemView = Backbone.View.extend({

  tagName: "li",

  initialize: function(someObj) {
    this.number = someObj.number;
    this.item = someObj.item;
  },

  render: function() {
    var innards = $("<h4>" + this.item + " " + this.number + "</h4>" + "<button class='delete'>DELETE</button> <button class='done'>Edit</button>");
    this.$el.html(innards);
  }
});

function getting(){
  $.get("/gettingitems",function(items) {
    var items = JSON.parse(items)

    for (i=0; i < items.length; i++){

      var view = new ItemView({
        id: items[i].id, 
        item: items[i].item, 
        number: items[i].number
      });

      view.render();

      $(".list").append(view.el);

      if (items[i].number > 0){
        done(items[i].number)
      } else if (items[i].number < 1) {
        $("."+ items[i].id).css("text-decoration", "line-through");
      }
    }
   deleting()   
  });
}


function writing(item,number){
  $.post("/add", {item: item, number:number}, function(data){
    data = JSON.parse(data)

    var view = new ItemView({ id: data, number: number, item: item });
    view.render();
    $(".list").append(view.el);
    
    deleting()
    done(number)
  })

}


function deleting(){
  $(".delete").click(function(){
  var deleteItem = event.target.parentNode
  var serverDelete = deleteItem.className
  deleteItem.remove()
$.ajax({
    url: '/delete',
    data: {deleting: serverDelete},
    type: 'DELETE',
    success: function(result) {
    }
  })
})
}

function done(number){
  $(".done").click(function(){
    $(event.target.parentNode).append("<input class='changing' placeholder="+number+"><button class='new'>UPDATE</button>")
      $(".new").click(function(){
          id = event.target.parentNode.id;
          howMany = event.target.parentNode.children[3].value
    $.ajax({
      url:'/edit',
      data: {editing: id, number: howMany},
      type: 'PUT',
      success: function(result){}
    })
    
    if (howMany < 1){
      var remove = this.parentNode.children
      items = remove[0].innerText.split(" ")
      remove[0].innerText = items[0]

      remove[4].parentNode.removeChild(remove[4])
      remove[3].parentNode.removeChild(remove[3])
      remove[2].parentNode.removeChild(remove[2])
      $("."+id).css("text-decoration", "line-through");

      } else if (howMany > 0){
        
        items = event.target.parentNode.children[0].innerText.split(" ")
        event.target.parentNode.children[0].innerText=items[0]+" " +howMany
          this.parentNode.removeChild(this.parentNode.children[3])
          this.parentNode.removeChild(this.parentNode.children[3])
      }


    })
    

  })
}