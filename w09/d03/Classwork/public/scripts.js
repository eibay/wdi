$(function(){

  add()

  var ItemView = Backbone.View.extend({
    tagName: "li",

    events: {
      "click button.delete": "destroy",
      "click button.edit":"edit",
      "click button.new":"newButton"
    },

    destroy: function(){
      $.ajax({
        url: '/delete',
        data: {deleting: this.id},
        type: 'DELETE',
        success: function(result){}
      })

    this.remove();
    },

    edit: function(){
      $(event.target.parentNode).append("<input class='changing' placeholder=" + this.number + "><button class='new'>UPDATE</button>")
    },

    newButton:  function(){
      var that = this
      
      var howMany = event.target.parentNode.children[3].value
      console.log(that)
      $.ajax({
        url:'/edit',
        data: {editing: this.id, number: howMany},
        type: 'PUT',
        success: function(result){}
      })

      that.number = howMany
      var remove = event.target.parentNode.children
      remove[4].parentNode.removeChild(remove[4])
      remove[3].parentNode.removeChild(remove[3])
      var items = remove[0].innerText.split(" ")
      if (howMany < 1){
        remove[0].innerText = items[0]
        remove[2].parentNode.removeChild(remove[2])
        var addingClass = this.$el[0].firstChild
        $(addingClass).addClass("doneThis")
      }else if (howMany > 0){
       remove[0].innerText=items[0]+" " +howMany
      }
         
    },

    initialize: function(object){
      this.number = object.number;
      this.item = object.item;
    },

    render: function(){
      if (this.number > 0) {
        var inside = $("<h4>" + this.item + " " + this.number + "</h4>" + "<button class='delete'>DELETE</button> <button class='edit'>Edit</button>");
      } else {
        var inside = $("<h4 class='doneThis'>" + this.item + " " + "</h4>" + "<button class='delete'>DELETE</button>");
      }
      this.$el.html(inside)
    }

  });

  function add(){
    getting()
    $(".adding").click(function(){
      var item = event.target.parentNode.children[0].value
      var number = event.target.parentNode.children[1].value
      writing(item,number)
      event.target.parentNode.children[0].value=""
      event.target.parentNode.children[1].value = ""
    })
  }

  function getting(){
    $.get("/gettingitems",function(items){
      var items = JSON.parse(items)
      for (i=0; i < items.length; i++){
        var newView = new ItemView ({
          id: items[i].id,
          item: items[i].item,
          number: items[i].number
        });

       newView.render();
      $(".list").append(newView.el);
      }
    })
  }


  function writing(item,number){
    $.post("/add", {item: item, number:number}, function(data){
      data = JSON.parse(data)
      var newView = new ItemView({
        id: data,
        number: number, 
        item: item
      });
      newView.render()
    $(".list").append(newView.el);
    })
  }

})


