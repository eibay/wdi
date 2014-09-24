function changeQuantityInDB (id, amount) {
	var xhr = new XMLHttpRequest
	var path = "/quantity" + "?" + id + "=" + amount
	xhr.open("PUT", path, true)
	xhr.send()
}