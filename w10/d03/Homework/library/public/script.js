var BookModel = Backbone.model.extend({
	urlRoot: "/book"
})

var BookCollection = Backbone.Collection.extend({
	url: "/books"
})

