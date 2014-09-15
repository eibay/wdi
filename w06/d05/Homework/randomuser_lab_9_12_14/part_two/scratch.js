genParams = function(path) {
	var dummies = path.split("?")[1].split("&");
	var params = {};
	params[dummies[0].split("=")[0]] = dummies[0].split("=")[1];
	params[dummies[1].split("=")[0]] = dummies[1].split("=")[1];
	return params;
}

path = "/users?page_length=5&page_num=3";

var parcel = genParams(path);

debugger