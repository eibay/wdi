var ItemView = Backbone.View.extend({

  tagName: "li",

  template: _.template( $("#template").html() ),

  events: {
    "click button.delete" : "destroy",
    "click button.edit" : "toggleEdit",
    "click button.update" : "update"
  },

  destroy: function() {
    this.model.destroy();
  },

  update: function() {
    this.model.set('number', this.$el.find('input[name="quantity"]').val());
    this.model.save();
  },

  toggleEdit: function() {
    this.$el.find('.edit-fields').toggle();
  },

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy remove", this.remove);
  },

  render: function() {
    this.$el.html( this.template(this.model.attributes) );
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

var ListView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, "add", this.addOne);

    collection.fetch();
  },

  addOne: function(item) {
    var view = new ItemView({model: item});
    view.render();
    this.$el.append(view.el);
  }
});

var list = new ListView({ 
  collection: collection, 
  el: $("ul") 
`});

var FormView = Backbone.View.extend({
  events: {
    "click button.adding" : "create"
  },

  create: function() {
    var itemName = this.$el.find('input[name="item-name"]').val();
    var quantity = this.$el.find('input[name="number"]').val();

    this.collection.create({ item: itemName, number: quantity });
  }
});

var formView = new FormView({ el: $(".form"), collection: collection })