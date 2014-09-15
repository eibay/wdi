function genParams(path) {
	var dummies = path.split("?")[1].split("&")
	params = {
		dummies[0].split("=")[0]: dummies[0].split("=")[1],
		dummies[1].split("=")[0]: dummies[1].split("=")[1],
	}
}

path = "/users?page_length=5&page_num=3"

debugger