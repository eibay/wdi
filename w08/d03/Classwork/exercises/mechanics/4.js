function storeHelloAll(array) {
	var store = []
	array.forEach(function(name) {
		store.push("hello " + name)
	})
	return store
}

nameArray = ["Michael", "Jesus", "Walter", "Donald"]

