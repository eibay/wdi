var findCompanyByName = function(path, arr) {
	for (i=0; i < arr.length; i++) {
		if (path == arr[i]["name"]) {
			msg = arr[i]
		} else msg = "name not found"
	}
	return msg
}