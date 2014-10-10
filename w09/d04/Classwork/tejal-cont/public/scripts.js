var ItemView = Backbone.View.extend({
  //creating  a new view
  //this is for combining data from dom and server

  tagName: "li",
  //creating element container that will be a li
  //if didnt put that-default would be div

  template: _.template( $("#template").html() ),
  // this is calling the template

  events: {
    "click button.delete" : "destroy",
    "click button.edit" : "toggleEdit",
    "click button.update" : "update"
  },

//adding event listeners to these buttons and telling them what to do

  destroy: function() {
    this.model.destroy();
  },
  //destroying the model

  update: function() {
    this.model.set('number', this.$el.find('input[name="quantity"]').val());
    this.model.save();
  },
//updating the modep after it finds the thing you are updating


  toggleEdit: function() {
    this.$el.find('.edit-fields').toggle();
  },

//toggling the button

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy", this.remove);
    //
  },

  //adding event listeners and saying if the model changes, render it in the dom
  //the other one is listing for this model to destroy and collection for remove
  //and then will remove it in the dom

  render: function() {
    this.$el.html( this.template(this.model.attributes) );
    //render in the template
  }
});

var ItemModel = Backbone.Model.extend({
  urlRoot: "/items"
  //making a model
});

var ItemCollection = Backbone.Collection.extend({
  url: "/items",
  model: ItemModel
});
//making a collection for the Models that you speciffy

collection = new ItemCollection();

var ListView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, "add", this.addOne);
    //making a new view for the collection
    //listenig to add and then doing addOne and creating a model because that is what create does

    collection.fetch();
    //fetches data from the database
  },

  

  addOne: function(item) {
    var view = new ItemView({model: item});
    //making  a new model  in the background with this model
    //item is the name of the new model

    view.render();
    this.$el.append(view.el);
  }
});

var list = new ListView({ collection: collection, el: $("ul") });
//telling it to get the data from the collection and dont make a new container but use
//this one

var FormView = Backbone.View.extend({
  events: {
    "click button.adding" : "create"
  },

  create: function() {
    var itemName = this.$el.find('input[name="item-name"]').val();
    var quantity = this.$el.find('input[name="number"]').val();

    this.collection.create({ item: itemName, number: quantity });
    //creates an instance of model
  }
});

var formView = new FormView({ el: $(".form"), collection: collection })